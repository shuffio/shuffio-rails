namespace :export do
  desc 'Export Seasons'
  task seasons: :environment do
    puts Season.all.map { |s|
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
    puts Division.all.map { |d|
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
end
