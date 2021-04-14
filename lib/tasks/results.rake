namespace :results do
  desc 'Spring 2021 Mini League Playoffs'
  task spring_2021: :environment do
    # Tournament Structure
    chicago = Location.find_by(name: 'Royal Palms Chicago')
    start_time = DateTime.new(2021, 4, 11, 13, 0, 0, 'CDT')

    playoffs = Tournament.find_or_create_by(name: 'Royal Palms Chicago Spring 2021 Mini-Season Playoffs') do |t|
      t.start_time = start_time
      t.format = 'single_elimination'
      t.location = chicago
    end

    playoffs_group = TournamentGroup.find_or_create_by(tournament: playoffs, name: 'Single Elimination') do |tg|
      tg.bracket_start_time = start_time
    end

    r16 = TournamentRound.find_or_create_by(tournament_group: playoffs_group, number: 1) do |tg|
      tg.name = 'Round of 16'
      tg.format = 'bracket_single_elimination'
    end

    r8 = TournamentRound.find_or_create_by(tournament_group: playoffs_group, number: 2) do |tg|
      tg.name = 'Round of 8'
      tg.format = 'bracket_single_elimination'
    end

    r4 = TournamentRound.find_or_create_by(tournament_group: playoffs_group, number: 3) do |tg|
      tg.name = 'Semi-Finals'
      tg.format = 'bracket_single_elimination'
    end

    r2 = TournamentRound.find_or_create_by(tournament_group: playoffs_group, number: 4) do |tg|
      tg.name = 'Finals'
      tg.format = 'bracket_single_elimination'
    end

    # Teams
    punfree = Team.find_by(name: 'Pun-free Shuffling')
    tutang = Team.find_by(name: 'Tu-Tang Clan')
    bozo = Team.find_by(name: 'Bozo Buckets')
    bbk = Team.find_by(name: 'A big beautiful kitchen')
    hell = Team.find_by(name: "Hell's Kitchen")
    bats = Team.find_by(name: 'The Bats')
    hammer = Team.find_by(name: 'Hammer Time')
    bisquicks = Team.find_by(name: 'Bisquicks')
    chunk = Team.find_by(name: 'Shuff It Chunk!')
    swift = Team.find_by(name: 'Swift Biscuits')
    hern = Team.find_by(name: 'Herniated Discs')
    summer = Team.find_by(name: 'Summer Shufflerz')

    # Round of 16 Matches
    Match.find_or_create_by(tournament_round: r16, tournament_order: 2) do |m|
      m.away_team = punfree
      m.home_team = tutang
      m.time = start_time
      m.comment = 'Spring 2021 Playoffs - Round of 16'
      m.court = chicago.courts.find_by(name: 'Court 01')
      m.away_score = 0
      m.home_score = 1
    end

    Match.find_or_create_by(tournament_round: r16, tournament_order: 4) do |m|
      m.away_team = bozo
      m.home_team = bbk
      m.time = start_time
      m.comment = 'Spring 2021 Playoffs - Round of 16'
      m.court = chicago.courts.find_by(name: 'Court 05')
      m.away_score = 1
      m.home_score = 0
    end

    Match.find_or_create_by(tournament_round: r16, tournament_order: 6) do |m|
      m.away_team = hell
      m.home_team = bats
      m.time = start_time
      m.comment = 'Spring 2021 Playoffs - Round of 16'
      m.court = chicago.courts.find_by(name: 'Court 06')
      m.away_score = 0
      m.home_score = 1
    end

    Match.find_or_create_by(tournament_round: r16, tournament_order: 8) do |m|
      m.away_team = hammer
      m.home_team = bisquicks
      m.time = start_time
      m.comment = 'Spring 2021 Playoffs - Round of 16'
      m.court = chicago.courts.find_by(name: 'Court 10')
      m.away_score = 1
      m.home_score = 0
    end

    # Round of 8 Matches
    Match.find_or_create_by(tournament_round: r8, tournament_order: 1) do |m|
      m.away_team = chunk
      m.home_team = tutang
      m.time = start_time + 1.hour
      m.comment = 'Spring 2021 Playoffs - Round of 8'
      m.court = chicago.courts.find_by(name: 'Court 06')
      m.away_score = 0
      m.home_score = 1
    end

    Match.find_or_create_by(tournament_round: r8, tournament_order: 2) do |m|
      m.away_team = swift
      m.home_team = bozo
      m.time = start_time + 1.hour
      m.comment = 'Spring 2021 Playoffs - Round of 8'
      m.court = chicago.courts.find_by(name: 'Court 10')
      m.away_score = 0
      m.home_score = 1
    end

    Match.find_or_create_by(tournament_round: r8, tournament_order: 3) do |m|
      m.away_team = hern
      m.home_team = bats
      m.time = start_time + 1.hour
      m.comment = 'Spring 2021 Playoffs - Round of 8'
      m.court = chicago.courts.find_by(name: 'Court 01')
      m.away_score = 1
      m.home_score = 0
    end

    Match.find_or_create_by(tournament_round: r8, tournament_order: 4) do |m|
      m.away_team = summer
      m.home_team = hammer
      m.time = start_time + 1.hour
      m.comment = 'Spring 2021 Playoffs - Round of 8'
      m.court = chicago.courts.find_by(name: 'Court 05')
      m.away_score = 1
      m.home_score = 0
    end

    # Semi-Final Matches
    Match.find_or_create_by(tournament_round: r4, tournament_order: 1) do |m|
      m.away_team = tutang
      m.home_team = bozo
      m.time = start_time + 2.hours
      m.comment = 'Spring 2021 Playoffs - Semi-Finals'
      m.court = chicago.courts.find_by(name: 'Court 04')
      m.away_score = 1
      m.home_score = 0
    end

    Match.find_or_create_by(tournament_round: r4, tournament_order: 2) do |m|
      m.away_team = hern
      m.home_team = summer
      m.time = start_time + 2.hours
      m.comment = 'Spring 2021 Playoffs - Semi-Finals'
      m.court = chicago.courts.find_by(name: 'Court 02')
      m.away_score = 1
      m.home_score = 0
    end

    # Final
    Match.find_or_create_by(tournament_round: r2, tournament_order: 1) do |m|
      m.away_team = tutang
      m.home_team = hern
      m.time = start_time + 3.hours
      m.comment = 'Spring 2021 Playoffs - Finals'
      m.court = chicago.courts.find_by(name: 'Court 03')
      m.away_score = 0
      m.home_score = 1
    end

    Season.find_by(name: 'Spring 2021').update(champion: hern)
  end
end
