namespace :stats do
  # convert number of points to number of scoring discs
  def points_to_scores(points)
    raise 'Points must be between -40 and 40' if points < -40
    raise 'Points must be between -40 and 40' if points > 40
    return -4 if points == -40
    return -3 if points <= -30
    return -2 if points <= -20
    return -1 if points <= -10
    return 0 if points <= 0
    return 1 if points <= 10
    return 2 if points <= 20
    return 3 if points <= 27
    # technically 28 and 30 points could be gotten with 3 or 4 scores, but 3 would be rare
    return 4 if points <= 40
  end

  # frame_winner(8, 0, 'y')
  def frame_winner(yellow_points, black_points, pilot_color)
    raise "pilot_color should be 'y' or 'b'" unless %w[y b].include?(pilot_color)
    return 'y' if points_to_scores(yellow_points) > points_to_scores(black_points)
    return 'b' if points_to_scores(black_points) > points_to_scores(yellow_points)

    # if tied, pilot team wins frame
    pilot_color
  end

  desc 'Generate Stats'
  task generate: :environment do
    turn_order = [
      %w[y b b y y b b y y b b y], # game 1
      %w[y b b y y b b y y b b y], # game 2
      %w[y b y b y b y b] # game 3 - the score JSONs don't handle switching color in their data structure, so this is best
    ]

    player_order = [
      [1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2], # game 1
      [3, 4, 3, 4, 3, 4, 3, 4, 3, 4, 3, 4], # game 2
      [1, 2, 3, 4, 1, 2, 3, 4] # game 3
    ]

    stats = {}

    Dir.glob(Rails.root.join('tmp/scores/*.json')) do |json_file|
      data_hash = JSON.parse(File.read(json_file))

      data_hash['frames'].each_with_index do |game, game_index|
        # Skip game if there are empty strings instead of scores
        next if game[0][0] == ''

        # Set Teams
        yellow_team = game_index.even? ? data_hash['starting_yellow_team'] : data_hash['starting_black_team']
        black_team = game_index.even? ? data_hash['starting_black_team'] : data_hash['starting_yellow_team']

        # Define teams if needed
        stats[yellow_team] = {} if stats[yellow_team].nil?
        stats[black_team] = {} if stats[black_team].nil?

        # Define players if needed
        (1..4).each do |player_number|
          if stats[yellow_team][player_number].nil?
            stats[yellow_team][player_number] = {
              frames_played: 0,
              pilot_frames_played: 0,
              hammer_frames_played: 0,
              points_for: 0,
              points_against: 0,
              point_diff: 0,
              hammers_won: 0,
              hammers_stolen: 0
            }
          end

          if stats[black_team][player_number].nil? # rubocop:disable Style/Next
            stats[black_team][player_number] = {
              frames_played: 0,
              pilot_frames_played: 0,
              hammer_frames_played: 0,
              points_for: 0,
              points_against: 0,
              point_diff: 0,
              hammers_won: 0,
              hammers_stolen: 0
            }
          end
        end

        # Game arrays currently have cumulative score, which we don't want for stats
        game_diff = []
        game.each_with_index do |frame, i|
          if i.zero?
            game_diff.push(frame)
          else
            game_diff.push([(game[i][0] - game[i - 1][0]), (game[i][1] - game[i - 1][1])])
          end
        end

        game_diff.each_with_index do |frame, i|
          player_number = player_order[game_index][i]

          # Find Pilot Color
          pilot_color = turn_order[game_index][i]

          ##################
          # Generate Stats #
          ##################

          stats[yellow_team][player_number][:frames_played] += 1
          stats[black_team][player_number][:frames_played] += 1

          stats[yellow_team][player_number][:points_for] += frame[0]
          stats[black_team][player_number][:points_for] += frame[1]

          stats[yellow_team][player_number][:points_against] += frame[1]
          stats[black_team][player_number][:points_against] += frame[0]

          stats[yellow_team][player_number][:point_diff] += (frame[0] - frame[1])
          stats[black_team][player_number][:point_diff] += (frame[1] - frame[0])

          # yellow pilot / black hammer frames
          case pilot_color
          when 'y'
            stats[yellow_team][player_number][:pilot_frames_played] += 1
            stats[black_team][player_number][:hammer_frames_played] += 1

            stats[yellow_team][player_number][:hammers_stolen] += 1 if frame_winner(frame[0], frame[1], 'y') == 'y'
            stats[black_team][player_number][:hammers_won] += 1 if frame_winner(frame[0], frame[1], 'y') == 'b'

          # black pilot / yellow hammer frames
          when 'b'
            stats[yellow_team][player_number][:hammer_frames_played] += 1
            stats[black_team][player_number][:pilot_frames_played] += 1

            stats[yellow_team][player_number][:hammers_won] += 1 if frame_winner(frame[0], frame[1], 'y') == 'y'
            stats[black_team][player_number][:hammers_stolen] += 1 if frame_winner(frame[0], frame[1], 'y') == 'b'
          end
        end
      end
    end

    require 'csv'

    CSV.open(Rails.root.join('tmp/scores/shufflinsanity-stats.csv'), 'wb') do |csv|
      # Headers
      per_frame_headers = [
        :points_for_per_frame,
        :points_against_per_frame,
        :point_diff_per_frame,
        :hammers_won_per_hammer_frame,
        :hammers_stolen_per_pilot_frame,
        :shuffio_player_rating
      ]
      csv << [:team, :player_number] + stats.first[1][1].keys + per_frame_headers

      stats.each do |team, players|
        players.each do |number, player_stats|
          # Calculate per-frame stats
          per_frame_stats = [
            player_stats[:points_for].to_f / player_stats[:frames_played],
            player_stats[:points_against].to_f / player_stats[:frames_played],
            player_stats[:point_diff].to_f / player_stats[:frames_played],
            player_stats[:hammers_won].to_f / player_stats[:hammer_frames_played],
            player_stats[:hammers_stolen].to_f / player_stats[:pilot_frames_played],
            (100.0 * (player_stats[:hammers_won] + player_stats[:hammers_stolen]) / player_stats[:frames_played]).round
          ]

          csv << [team, number] + player_stats.values + per_frame_stats
        end

        # TODO: combined team stats?
      end
    end

    # Debugging
    # binding.pry
    # puts JSON.pretty_generate(stats)
  end
end
