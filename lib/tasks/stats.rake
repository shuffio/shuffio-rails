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
    # TODO: chi-16-1 and chi-16-2 are missing
    # Should I be building this into a our models/classes? probably.

    turn_order = [
      %w[y b b y y b b y y b b y], # game 1
      %w[y b b y y b b y y b b y], # game 2
      %w[y b y b y b y b] # game 3 - so... our JSON doesn't "handle" switching color in its data structure , so this is best. trust me.
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

          # Set Teams
          yellow_team = game_index.even? ? data_hash['starting_yellow_team'] : data_hash['starting_black_team']
          black_team = game_index.even? ? data_hash['starting_black_team'] : data_hash['starting_yellow_team']

          # Find Pilot Color
          pilot_color = turn_order[game_index][i]
          # Define teams if needed
          stats[yellow_team] = {} if stats[yellow_team].nil?
          stats[black_team] = {} if stats[black_team].nil?

          # Define players if needed
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

          if stats[black_team][player_number].nil?
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
            stats[yellow_team][player_number][:pilot_frames_played] += 1
            stats[black_team][player_number][:hammer_frames_played] += 1

            stats[yellow_team][player_number][:hammers_won] += 1 if frame_winner(frame[0], frame[1], 'y') == 'y'
            stats[black_team][player_number][:hammers_stolen] += 1 if frame_winner(frame[0], frame[1], 'y') == 'b'
          end
        end
      end
    end

    # binding.pry

    # TODO: combined team stats?
    # TODO: calculate per-frame stats?

    # TODO: replace this with a nice CSV or similar
    puts JSON.pretty_generate(stats)
  end
end
