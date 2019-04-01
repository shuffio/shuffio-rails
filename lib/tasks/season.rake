namespace :season do
  desc 'Create Spring 2019'
  task create_spring_2019: :environment do
    spring = Season.find_or_create_by(name: 'Spring 2019') do |s|
      s.start_date = '2019-04-01'
      s.playoff_date = '2019-06-02'
      s.banquet_date = '2019-06-03'
    end

    Division.find_or_create_by(name: 'Monday Pilot', season: spring) do |d|
      d.day_of_week = 1
      d.time = '18:30'
    end

    Division.find_or_create_by(name: 'Monday Cherry', season: spring) do |d|
      d.day_of_week = 1
      d.time = '19:30'
    end

    Division.find_or_create_by(name: 'Monday Hammer', season: spring) do |d|
      d.day_of_week = 1
      d.time = '20:30'
    end

    Division.find_or_create_by(name: 'Tuesday Pilot', season: spring) do |d|
      d.day_of_week = 2
      d.time = '18:30'
    end

    Division.find_or_create_by(name: 'Tuesday Cherry', season: spring) do |d|
      d.day_of_week = 2
      d.time = '19:30'
    end

    Division.find_or_create_by(name: 'Tuesday Hammer', season: spring) do |d|
      d.day_of_week = 2
      d.time = '20:30'
    end
  end

  desc 'Set up Schedule for a Season'
  task schedule: :environment do
    ActiveRecord::Base.logger.level = 1
    season = Season.find_by(name: 'Spring 2019')

    abort 'Season already has matches scheduled, aborting' if season.matches.any?

    season.divisions.each do |d|
      continue = 'n'

      until continue == 'y'
        d.matches.each { |m| m.destroy }
        matches = d.create_matches

        # TODO: Make this logic better and part of the model
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

        puts "#{d.name} - Teams with Bye Weeks"
        bye_teams.reject! { |_t, c| c.zero? }
        bye_teams.each { |t, c| puts "#{c}\t#{t}" }

        puts 'Do you wish to save this? (y/n)'
        continue = STDIN.gets.chomp
      end
    end
  end

  desc 'Report on uneven bye weeks'
  task bye_report: :environment do
    abort 'This task no longer needed'
  end
end
