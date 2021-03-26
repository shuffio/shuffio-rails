namespace :stats do
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

        game.each_with_index do |frame, i|
          player_number = player_order[game_index][i]

          # Set Teams
          yellow_team = game_index.even? ? data_hash['starting_yellow_team'] : data_hash['starting_black_team']
          black_team = game_index.even? ? data_hash['starting_black_team'] : data_hash['starting_yellow_team']

          # Define teams if needed
          stats[yellow_team] = {} if stats[yellow_team].nil?
          stats[black_team] = {} if stats[black_team].nil?

          # Define players if needed
          if stats[yellow_team][player_number].nil?
            stats[yellow_team][player_number] = {
              frames_played: 0,
              points_for: 0,
              points_against: 0,
              point_diff: 0
            }
          end

          if stats[black_team][player_number].nil?
            stats[black_team][player_number] = {
              frames_played: 0,
              points_for: 0,
              points_against: 0,
              point_diff: 0
            }
          end

          ##################
          # Generate Stats #
          ##################

          stats[yellow_team][player_number][:frames_played] += 1
          stats[black_team][player_number][:frames_played] += 1

          # TODO: oops. we are adding the cumulative scores here, not the frame score. time to build some helper functions

          stats[yellow_team][player_number][:points_for] += frame[0]
          stats[black_team][player_number][:points_for] += frame[1]

          stats[yellow_team][player_number][:points_against] += frame[1]
          stats[black_team][player_number][:points_against] += frame[0]

          stats[yellow_team][player_number][:point_diff] += (frame[0] - frame[1])
          stats[black_team][player_number][:point_diff] += (frame[1] - frame[0])
        end
      end
    end

    # binding.pry

    # TODO: replace this with a nice CSV or similar
    puts JSON.pretty_generate(stats)
  end
end
