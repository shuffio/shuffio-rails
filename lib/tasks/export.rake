namespace :export do
  desc 'Export Seasons'
  task seasons: :environment do
    puts Season.where('id != 9').map { |s|
      s.slice([
                :name,
                :start_date
              ]).merge(
                end_date: s.banquet_date,
                currency: 'USD',
                cost: 50_000,
                organization_id: 1,
                venue_id: 1,
                visibility: 'unlisted',
                min_players_per_team: 4,
                max_players_per_team: 10
              )
    }.to_json
  end

  desc 'Export Divisions'
  task divisions: :environment do
    puts Division.where('season_id != 9').map { |d|
      d.slice([
                :name,
                :day_of_week
              ]).merge(
                start_time: d.time,
                season_name: d.season.name,
                visibility: 'live',
                max_competitors: 20
              )
    }.to_json

    # TODO: final_standings
  end

  desc 'Export Teams'
  task teams: :environment do
    # TODO: make sure no team has the same name... there were 4 de-duped in rails c
    teams = Division.where('season_id != 9').map(&:teams).flatten(1).uniq # Season #9 was Brooklyn
    puts teams.map { |t|
      t.slice([
                :id,
                :name,
                :former_names,
                :image_uri,
                :instagram_user
              ])
    }.to_json
  end

  desc 'Export Matches'
  task matches: :environment do
    teams = Division.where('season_id != 9').map(&:teams).flatten(1).uniq # Season #9 was Brooklyn
    matches = teams.map(&:matches).flatten(1).uniq

    puts matches.map { |m|
      m.slice([
                :time,
                :away_team_id,
                :home_team_id,
                :away_score,
                :home_score,
                :comment,
                :multiplier
              ]).merge(
                season: m.division ? m.season.name : nil,
                division: m.division ? m.division.name : nil,
                court: m.court ? m.court.name : m.location
              )
    }.to_json
  end

  # This one gets a bit complex, so we'll taylor to the RecRec import
  desc 'Export Registrations'
  task registrations: :environment do
    division_teams = []

    Division.where('season_id != 9').each do |d|
      d.teams.each do |t|
        division_teams.push(
          season: d.season.name,
          division: d.name,
          shuffio_id: t.id
        )
      end
    end

    puts division_teams.to_json
  end
end
