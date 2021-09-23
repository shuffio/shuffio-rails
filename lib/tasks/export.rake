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
                season_name: d.season.name
              )
    }.to_json
  end
end
