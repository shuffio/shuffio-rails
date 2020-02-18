namespace :match do
  desc 'Interactive task/report for data entry of a week in a division'
  task report: :environment do
    # Turn off ActiveRecord logs
    ActiveRecord::Base.logger.level = 1

    # Get Season
    season = nil

    begin
      STDOUT.puts 'What Season is this: none, spring, summer, fall, or winter (default)?'
      season_input = STDIN.gets.strip.downcase
    end until ['none', 'spring', 'summer', 'fall', 'winter', ''].include?(season_input)

    case season_input
    when 'spring'
      season = Season.find_by(name: 'Spring 2018')
    when 'summer'
      season = Season.find_by(name: 'Summer 2018')
    when 'fall'
      season = Season.find_by(name: 'Fall 2018')
    when 'winter'
      season = Season.find_by(name: 'Winter 2019')
    when ''
      season = Season.find_by(name: 'Winter 2019')
    end

    # Get Division if Season was set
    division = nil

    if season
      begin
        STDOUT.puts 'What Day: Monday (m) or Tuesday (t)?'
        day_input = STDIN.gets.strip.downcase
      end until %w[m monday t tuesday].include?(day_input)

      begin
        STDOUT.puts 'What Time: 6:30 (6), 7:30 (7), or 8:30 (8)?'
        time_input = STDIN.gets.strip.downcase
      end until ['6', '6:30', '7', '7:30', '8', '8:30'].include?(time_input)

      case day_input
      when 'm'
        day_of_week = 1
      when 'monday'
        day_of_week = 1
      when 't'
        day_of_week = 2
      when 'tuesday'
        day_of_week = 2
      end

      case time_input
      when '6'
        time = '18:30:00'
      when '6:30'
        time = '18:30:00'
      when '7'
        time = '19:30:00'
      when '7:30'
        time = '19:30:00'
      when '8'
        time = '20:30:00'
      when '8:30'
        time = '20:30:00'
      end

      division = Division.find_by(season: season, day_of_week: day_of_week, time: time)

      # Determine Match time based on week
      begin
        STDOUT.puts 'What Week (1-8)?'
        week = STDIN.gets.strip.to_i
      end until [*1..8].include?(week)

      match_time = division.match_time_for_week(week)

      courts = [*1..10]
    else
      # Not a league game, get Match time and Court
      begin
        STDOUT.puts 'What Date/Time did this happen in Chicago time? (example: 2018-06-26 18:30)'
        date_time_input = STDIN.gets.strip
      end until Time.parse(date_time_input)

      match_time = Time.find_zone('America/Chicago').parse(date_time_input)

      begin
        STDOUT.puts 'What Court (1-10)?'
        court_input = STDIN.gets.strip
      end until [*1..10].include?(court_input.to_i)

      courts = [court_input.to_i]
    end

    matches = []

    # For each Court
    courts.each do |c|
      STDOUT.puts "\n\e[36mLet's dig into Court #{c}!\e[0m"

      # Get Teams
      begin
        STDOUT.puts "\nWho was the Away Team?"
        away_team_input = STDIN.gets.strip

        away_team = Season.latest.teams.find_by(name: away_team_input)
        verify = 'y'

        # do a fuzzy search if we don't find an exact tname
        unless away_team
          away_team = Season.latest.teams.basic_search(away_team_input).first

          if away_team
            name = away_team.name
            name += ', formerly ' + away_team.former_names if away_team.former_names

            STDOUT.puts "\e[33mFound team '#{name}' Is that correct (y/n)?\e[0m"
            verify = STDIN.gets.strip.downcase
          else
            STDOUT.puts "\e[31mDidn't find team '#{away_team_input}'. Please try again.\e[0m"
            verify = 'n'
          end
        end
      end until verify == 'y'

      begin
        STDOUT.puts "\nWho was the Home Team?"
        home_team_input = STDIN.gets.strip

        home_team = Season.latest.teams.find_by(name: home_team_input)
        verify = 'y'

        # do a fuzzy search if we don't find an exact tname
        unless home_team
          home_team = Season.latest.teams.basic_search(home_team_input).first

          if home_team
            name = home_team.name
            name += ', formerly ' + home_team.former_names if home_team.former_names

            STDOUT.puts "\e[33mFound team '#{name}' Is that correct (y/n)?\e[0m"
            verify = STDIN.gets.strip.downcase
          else
            STDOUT.puts "\e[31mDidn't find team '#{home_team_input}'. Please try again.\e[0m"
            verify = 'n'
          end
        end
      end until verify == 'y'

      # Get Winner
      begin
        STDOUT.puts "\nWho won, away (a), home (h), or tie (t)?"
        winner_input = STDIN.gets.strip.downcase
      end until %w[away a home h tie t].include?(winner_input)

      case winner_input
      when 'away'
        away_score = 1
        home_score = 0
      when 'a'
        away_score = 1
        home_score = 0
      when 'home'
        away_score = 0
        home_score = 1
      when 'h'
        away_score = 0
        home_score = 1
      when 'tie'
        away_score = 0
        home_score = 0
      when 't'
        away_score = 0
        home_score = 0
      end

      matches.push(
        Match.create!(
          time: match_time,
          division: division,
          location: "Court #{format('%02d', c)}",
          away_team: away_team,
          home_team: home_team,
          away_score: away_score,
          home_score: home_score
        )
      )
    end

    # Print Results
    if division
      STDOUT.puts division.report_for_week(week)
    else
      STDOUT.puts matches.first.inspect
    end
  end

  desc 'Look at some of the best matches of the upcoming week'
  task of_the_week: :environment do
    ActiveRecord::Base.logger.level = 1

    season = Season.last

    begin
      STDOUT.puts 'What Week (1-8)?'
      week = STDIN.gets.strip.to_i
    end until [*1..8].include?(week)

    begin
      STDOUT.puts 'What is the max ELO diff? (50 is a good default)'
      elo_diff = STDIN.gets.strip.to_i
    end until elo_diff.positive?

    begin
      STDOUT.puts 'What is the ELO floor? (1000 is a good default)'
      elo_floor = STDIN.gets.strip.to_i
    end until elo_floor.positive?

    season.divisions.each do |d|
      STDOUT.puts d.name
      STDOUT.puts '==========='

      d.matches_for_week(week).each do |m|
        # skip if ELO is low
        next if m.home_team.elo_cache <= elo_floor
        next if m.away_team.elo_cache <= elo_floor

        # skip if ELO difference is high
        next if (m.home_team.elo_cache - m.away_team.elo_cache).abs > elo_diff

        STDOUT.puts "#{m.location} - #{m.home_team.name} (#{m.home_team.elo_cache}) vs #{m.away_team.name} (#{m.away_team.elo_cache})"
      end

      STDOUT.puts ''
    end
  end

  desc "Update the Match's multiplier to 0.5 if it is a 'Group Play' match"
  task update_match_multiplier_if_is_group_play: :environment do
    STDOUT.puts 'updating group play match multipliers...'
    Match.where('comment like ?', '%Group Play%').each do |m|
      m.update(multiplier: 0.5)
    end
    Match.recalculate_all_elo
    STDOUT.puts 'done.'
  end
end
