namespace :bracket do
  desc 'Create Winter 2020 Bracket'
  task create_winter_2020: :environment do
    winner = {}
    runner_up = {}
    tbd = Team.find_or_create_by(name: 'TBD')
    palms_chicago = Location.find_by(name: 'Royal Palms Chicago')
    court_3 = Court.find_by(name: 'Court 03', location: palms_chicago)

    # Create dummy teams
    ('A'..'H').each do |g|
      winner[g] = Team.find_or_create_by(name: "Winner Group #{g}")
      runner_up[g] = Team.find_or_create_by(name: "Runner Up Group #{g}")
    end

    # Create Main Tournament Object
    t = Tournament.find_or_create_by(
      name: 'Royal Palms Chicago Winter 2020 Playoffs',
      location: palms_chicago,
      start_time: Time.find_zone('America/Chicago').parse('2020-09-14 19:00:00'),
      end_time: Time.find_zone('America/Chicago').parse('2020-09-25 21:00:00'),
      format: 'single_elimination' # only track bracket for now
    )

    tg = TournamentGroup.find_or_create_by(
      tournament: t,
      name: 'Bracket'
    )

    # Round of 16
    round_of_16 = TournamentRound.find_or_create_by(
      tournament_group: tg,
      number: 1,
      name: 'Round of 16',
      format: 'bracket_single_elimination'
    )

    [
      { number: 1, away_team: winner['A'], home_team: runner_up['E'], time: '2020-09-21 18:00:00' },
      { number: 2, away_team: winner['B'], home_team: runner_up['F'], time: '2020-09-21 19:00:00' },
      { number: 3, away_team: winner['C'], home_team: runner_up['G'], time: '2020-09-22 18:00:00' },
      { number: 4, away_team: winner['D'], home_team: runner_up['H'], time: '2020-09-22 19:00:00' },
      { number: 5, away_team: winner['E'], home_team: runner_up['D'], time: '2020-09-23 18:00:00' },
      { number: 6, away_team: winner['F'], home_team: runner_up['C'], time: '2020-09-23 19:00:00' },
      { number: 7, away_team: winner['G'], home_team: runner_up['B'], time: '2020-09-24 18:00:00' },
      { number: 8, away_team: winner['H'], home_team: runner_up['A'], time: '2020-09-24 19:00:00' }
    ].each do |meta|
      Match.find_or_create_by(
        tournament_round: round_of_16,
        tournament_order: meta[:number]
      ) do |match|
        match.away_team = meta[:away_team]
        match.home_team = meta[:home_team]
        match.court = court_3
        match.time = Time.find_zone('America/Chicago').parse(meta[:time])
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
      { number: 1, away_team: tbd, home_team: tbd, time: '2020-09-21 20:00:00' },
      { number: 2, away_team: tbd, home_team: tbd, time: '2020-09-22 20:00:00' },
      { number: 3, away_team: tbd, home_team: tbd, time: '2020-09-23 20:00:00' },
      { number: 4, away_team: tbd, home_team: tbd, time: '2020-09-24 20:00:00' }
    ].each do |meta|
      Match.find_or_create_by(
        tournament_round: round_of_8,
        tournament_order: meta[:number]
      ) do |match|
        match.away_team = meta[:away_team]
        match.home_team = meta[:home_team]
        match.court = court_3
        match.time = Time.find_zone('America/Chicago').parse(meta[:time])
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
      { number: 1, away_team: tbd, home_team: tbd, time: '2020-09-25 18:00:00' },
      { number: 2, away_team: tbd, home_team: tbd, time: '2020-09-25 19:00:00' }
    ].each do |meta|
      Match.find_or_create_by(
        tournament_round: semi_final,
        tournament_order: meta[:number]
      ) do |match|
        match.away_team = meta[:away_team]
        match.home_team = meta[:home_team]
        match.court = court_3
        match.time = Time.find_zone('America/Chicago').parse(meta[:time])
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
      match.time = Time.find_zone('America/Chicago').parse('2020-09-25 20:00:00')
      match.away_score = 0
      match.home_score = 0
      match.comment = 'Winter 2020 Playoffs - Finals'
    end
  end
end
