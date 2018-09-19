namespace :match do
  desc 'Interactive task/report for data entry of a week in a division'
  task report: :environment do
    # Get Season
    season = nil

    begin
      STDOUT.puts 'What Season is this: none, spring, summer, or fall (default)?'
      season_input = STDIN.gets.strip.downcase
    end until ['none', 'spring', 'summer', 'fall', ''].include?(season_input)

    case season_input
    when 'spring'
      season = Season.find_by(name: 'Spring 2018')
    when 'summer'
      season = Season.find_by(name: 'Summer 2018')
    when 'fall'
      season = Season.find_by(name: 'Fall 2018')
    when ''
      season = Season.find_by(name: 'Fall 2018')
    end

    # Get Division if Season was set
    division = nil

    if season
      begin
        STDOUT.puts 'What Day: Monday (m) or Tuesday (t)?'
        day_input = STDIN.gets.strip.downcase
      end until ['m', 'monday', 't', 'tuesday'].include?(day_input)

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
        week_input = STDIN.gets.strip
      end until [*1..8].include?(week_input.to_i)

      match_day = season.start_date
      match_day += 1.day if day_of_week == 2

      (week_input.to_i - 1).times do
        match_day += 1.week
      end

      match_time = Time.find_zone('America/Chicago').parse("#{match_day.to_s} #{time}"),

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

        away_team = Team.find_by(name: away_team_input)
        verify = 'y'

        # do a fuzzy search if we don't find an exact tname
        unless away_team
          away_team = Team.basic_search(away_team_input).first

          if away_team
            STDOUT.puts "\e[33mFound team '#{away_team.name}' Is that correct (y/n)?\e[0m"
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

        home_team = Team.find_by(name: home_team_input)
        verify = 'y'

        # do a fuzzy search if we don't find an exact tname
        unless home_team
          home_team = Team.basic_search(home_team_input).first

          if home_team
            STDOUT.puts "\e[33mFound team '#{home_team.name}' Is that correct (y/n)?\e[0m"
            verify = STDIN.gets.strip.downcase
          else
            STDOUT.puts "\e[31mDidn't find team '#{home_team_input}'. Please try again.\e[0m"
            verify = 'n'
          end
        end
      end until verify == 'y'

      # Get Winner
      begin
        STDOUT.puts "\nWho won, away (a) or home (h)?"
        winner_input = STDIN.gets.strip.downcase
      end until ['away', 'a', 'home', 'h'].include?(winner_input)

      case winner_input
      when 'away'
        winner = 'away'
      when 'a'
        winner = 'away'
      when 'home'
        winner = 'home'
      when 'h'
        winner = 'home'
      end

      matches.push(
        Match.create!(
          time: Time.find_zone('America/Chicago').parse('2018-06-25 20:30:00'),
          division: division,
          location: "Court #{"%02d" % c}",
          away_team: away_team,
          home_team: home_team,
          away_score: (winner == 'away') ? 1 : 0,
          home_score: (winner == 'home') ? 1 : 0
        )
      )
    end

    # Print Results
    output = "\e[36mResults (winner underlined):\e[0m\n"
    output += "#{division.season.name} - #{division.name}" if division
    output += matches.first.time.in_time_zone('America/Chicago').to_s + "\n\n"

    matches.each do |m|
      output += "#{m.id}\t"
      output += "#{m.location}\t"
      output += "\e[4m" if m.away_score > m.home_score
      output += m.away_team.name + ' (A)'
      output += "\e[24m" if m.away_score > m.home_score
      output += ' vs. '
      output += "\e[4m" if m.home_score > m.away_score
      output += m.home_team.name + ' (H)'
      output += "\e[24m" if m.home_score > m.away_score
      output += "\n"
    end

    STDOUT.puts output
  end
end
