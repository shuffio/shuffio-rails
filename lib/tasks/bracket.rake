namespace :bracket do
  desc 'Create Winter 2020 Bracket'
  task create_winter_2020: :environment do
    winner = {}
    runner_up = {}
    tbd = Team.find_or_create_by(name: 'TBD')
    palms_chicago = Location.find_by(name: 'Royal Palms Chicago')
    palms_brooklyn = Location.find_by(name: 'Royal Palms Brooklyn')
    general_location = Location.find_or_create_by(name: 'Multiple Locations')

    # Create dummy teams
    ('A'..'H').each do |g|
      winner[g] = Team.find_or_create_by(name: "Winner Group #{g}")
      runner_up[g] = Team.find_or_create_by(name: "Runner Up Group #{g}")
    end

    # Create Main Tournament Object
    t = Tournament.find_or_create_by(
      name: 'Royal Palms 2020 Playoffs',
      location: general_location,
      start_time: Time.find_zone('America/Chicago').parse('2020-09-14 19:00:00'),
      end_time: Time.find_zone('America/Chicago').parse('2021-05-18 20:00:00'),
      format: 'single_elimination' # only track brackets for now
    )

    %w[Chicago Brooklyn].each do |city|
      court_3 = city == 'Chicago' ? Court.find_by(name: 'Court 03', location: palms_chicago) : Court.find_by(name: 'Court 03', location: palms_brooklyn)
      start_time = city == 'Chicago' ? Time.find_zone('America/Chicago').parse('2020-09-21 18:00:00') : Time.find_zone('America/New_York').parse('2020-10-26 18:00:00')

      tg = TournamentGroup.find_or_create_by(
        tournament: t,
        name: "#{city} Bracket"
      )

      # Round of 16
      round_of_16 = TournamentRound.find_or_create_by(
        tournament_group: tg,
        number: 1,
        name: 'Round of 16',
        format: 'bracket_single_elimination'
      )

      [
        { number: 1, away_team: winner['A'], home_team: runner_up['E'], time: start_time },
        { number: 2, away_team: winner['B'], home_team: runner_up['F'], time: start_time + 1.hour },
        { number: 3, away_team: winner['C'], home_team: runner_up['G'], time: start_time + 1.day },
        { number: 4, away_team: winner['D'], home_team: runner_up['H'], time: start_time + 1.day + 1.hour },
        { number: 5, away_team: winner['E'], home_team: runner_up['D'], time: start_time + 2.days },
        { number: 6, away_team: winner['F'], home_team: runner_up['C'], time: start_time + 2.days + 1.hour },
        { number: 7, away_team: winner['G'], home_team: runner_up['B'], time: start_time + 3.days },
        { number: 8, away_team: winner['H'], home_team: runner_up['A'], time: start_time + 3.days + 1.hour }
      ].each do |meta|
        Match.find_or_create_by(
          tournament_round: round_of_16,
          tournament_order: meta[:number]
        ) do |match|
          match.away_team = meta[:away_team]
          match.home_team = meta[:home_team]
          match.court = court_3
          match.time = meta[:time]
          match.away_score = 0
          match.home_score = 0
          match.comment = 'Winter 2020 Playoffs - Round of 16'
        end
      end

      # Round of 8
      round_of_8 = TournamentRound.find_or_create_by(
        tournament_group: tg,
        number: 2,
        name: 'Round of 8',
        format: 'bracket_single_elimination'
      )

      [
        { number: 1, away_team: tbd, home_team: tbd, time: start_time + 2.hours },
        { number: 2, away_team: tbd, home_team: tbd, time: start_time + 1.day + 2.hours },
        { number: 3, away_team: tbd, home_team: tbd, time: start_time + 2.days + 2.hours },
        { number: 4, away_team: tbd, home_team: tbd, time: start_time + 3.days + 2.hours }
      ].each do |meta|
        Match.find_or_create_by(
          tournament_round: round_of_8,
          tournament_order: meta[:number]
        ) do |match|
          match.away_team = meta[:away_team]
          match.home_team = meta[:home_team]
          match.court = court_3
          match.time = meta[:time]
          match.away_score = 0
          match.home_score = 0
          match.comment = 'Winter 2020 Playoffs - Round of 8'
        end
      end

      # Semi-Finals
      semi_final = TournamentRound.find_or_create_by(
        tournament_group: tg,
        number: 3,
        name: 'Semi-Finals',
        format: 'bracket_single_elimination'
      )

      [
        { number: 1, away_team: tbd, home_team: tbd, time: start_time + 4.days },
        { number: 2, away_team: tbd, home_team: tbd, time: start_time + 4.days + 1.hour }
      ].each do |meta|
        Match.find_or_create_by(
          tournament_round: semi_final,
          tournament_order: meta[:number]
        ) do |match|
          match.away_team = meta[:away_team]
          match.home_team = meta[:home_team]
          match.court = court_3
          match.time = meta[:time]
          match.away_score = 0
          match.home_score = 0
          match.comment = 'Winter 2020 Playoffs - Semi-Finals'
        end
      end

      # Final
      final = TournamentRound.find_or_create_by(
        tournament_group: tg,
        number: 4,
        name: 'Final',
        format: 'bracket_single_elimination'
      )

      Match.find_or_create_by(
        tournament_round: final,
        tournament_order: 1
      ) do |match|
        match.away_team = tbd
        match.home_team = tbd
        match.court = court_3
        match.time = start_time + 4.days + 2.hours
        match.away_score = 0
        match.home_score = 0
        match.comment = "Winter 2020 Playoffs - #{city} Finals"
      end
    end

    # Championship
    championship_group = TournamentGroup.find_or_create_by(
      tournament: t,
      name: 'Chicago vs Brooklyn Championship'
    )

    championship_round = TournamentRound.find_or_create_by(
      tournament_group: championship_group,
      number: 1,
      name: 'Chicago vs Brooklyn Championship',
      format: 'bracket_single_elimination'
    )

    Match.find_or_create_by(
      tournament_round: championship_round,
      tournament_order: 1
    ) do |match|
      match.away_team = tbd
      match.home_team = tbd
      match.court = Court.find_by(location: Location.find_by(name: 'St. Petersburg Shuffleboard Club'), name: 'Court T7')
      match.time = Time.find_zone('America/New_York').parse('2021-03-05 20:00:00')
      match.away_score = 0
      match.home_score = 0
      match.comment = 'Chicago vs Brooklyn 2020 Championship'
    end
  end
end
