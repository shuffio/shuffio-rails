namespace :season do
  desc 'Set up Schedule for a Season'
  task schedule: :environment do
    ActiveRecord::Base.logger.level = 1
    season = Season.find_by(name: 'Winter 2019')

    abort 'Season already has matches scheduled, aborting' if season.matches.any?

    season.divisions.each do |d|
      # Sort teams into away and home via snake order
      teams = d.teams.order(:elo_cache)
      away_teams = [
        teams[0],
        teams[3],
        teams[4],
        teams[7],
        teams[8],
        teams[11],
        teams[12],
        teams[15],
        teams[16],
        teams[19]
      ]
      home_teams = [
        teams[1],
        teams[2],
        teams[5],
        teams[6],
        teams[9],
        teams[10],
        teams[13],
        teams[14],
        teams[17],
        teams[18]
      ]

      # Randomize teams
      away_teams.shuffle!
      home_teams.shuffle!

      # Set up 8 weeks
      8.times do |w|
        # Set up week 1
        10.times do |i|
          Match.create!(
            time: d.match_time_for_week(w + 1),
            division: d,
            location: "Court #{format('%02d', i + 1)}",
            away_team: away_teams[i],
            home_team: home_teams[i],
            away_score: 0,
            home_score: 0
          )
        end

        # Away teams increase court # (1,2,3,4,etc)
        away_teams.rotate!(-1)
        # Home teams decreate court # (2,1,10,9,etc)
        home_teams.rotate!(1)
        # In week 5, home moves twice
        home_teams.rotate!(1) if w == 3
      end
    end
  end

  desc 'Report on uneven bye weeks'
  task bye_report: :environment do
    ActiveRecord::Base.logger.level = 1
    season = Season.find_by(name: 'Winter 2019')

    season.divisions.each do |d|
      away_teams = d.matches_for_week(1).map(&:away_team)
      home_teams = d.matches_for_week(1).map(&:home_team)
      combos = away_teams.map(&:id).product(home_teams.map(&:id))

      # Remove matches that are scheduled
      d.matches.each do |m|
        combos.reject! { |z| z[0] == m.away_team_id && z[1] == m.home_team_id }
      end

      bye_teams = d.teams.map { |t| [t.display_name, 0] }.to_h

      combos.each do |m|
        away_team = Team.find(m[0])
        home_team = Team.find(m[1])

        if away_team.match_count == 8 && home_team.match_count > 8
          bye_teams[home_team.display_name] = bye_teams[home_team.display_name] + 1
        elsif home_team.match_count == 8 && away_team.match_count > 8
          bye_teams[away_team.display_name] = bye_teams[away_team.display_name] + 1
        end
      end

      puts d.name
      bye_teams.reject! { |_t, c| c.zero? }
      bye_teams.each { |t, c| puts "#{c}\t#{t}" }
      puts '-----------------------'
    end
  end
end
