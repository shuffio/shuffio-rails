namespace :season do
  desc 'Set up Schedule for a Season'
  task schedule: :environment do
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
end
