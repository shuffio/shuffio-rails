namespace :spring_2018 do
  desc 'Spring 2018 Generator'
  task create: :environment do
    spring = Season.find_by(name: 'Spring 2018')

    # Monday 6:30
    division = Division.find_by(season: spring, name: 'Monday Pilot')
    division.matches.destroy_all
    d_time = DateTime.parse('2018-04-09 23:30:00')

    back_that = Team.find(1) # starting_elo: 1017, starting_match_count: 8, starting_wins: 5, starting_losses: 3
    back_that.update(starting_elo: nil, starting_match_count: nil, starting_wins: nil, starting_losses: nil)
    tangbang = Team.find(19)
    tangbang.update(starting_elo: nil, starting_match_count: nil, starting_wins: nil, starting_losses: nil)
    pbd = Team.find(34)
    pbd.update(starting_elo: nil, starting_match_count: nil, starting_wins: nil, starting_losses: nil)
    beergeeks = Team.find(28)
    beergeeks.update(starting_elo: nil, starting_match_count: nil, starting_wins: nil, starting_losses: nil)
    shifty_mother = Team.find(35)
    shifty_mother.update(starting_elo: nil, starting_match_count: nil, starting_wins: nil, starting_losses: nil)
    binnies = Team.find(20)
    binnies.update(starting_elo: nil, starting_match_count: nil, starting_wins: nil, starting_losses: nil)
    shuffle_state = Team.find(37)
    shuffle_state.update(starting_elo: nil, starting_match_count: nil, starting_wins: nil, starting_losses: nil)
    butter_yo = Team.find(4)
    butter_yo.update(starting_elo: nil, starting_match_count: nil, starting_wins: nil, starting_losses: nil)
    skenders = Team.find(38)
    skenders.update(starting_elo: nil, starting_match_count: nil, starting_wins: nil, starting_losses: nil)
    cannon = Team.find(30)
    cannon.update(starting_elo: nil, starting_match_count: nil, starting_wins: nil, starting_losses: nil)
    usa = Team.find(46)
    usa.update(starting_elo: nil, starting_match_count: nil, starting_wins: nil, starting_losses: nil)
    wtf = Team.find(17)
    wtf.update(starting_elo: nil, starting_match_count: nil, starting_wins: nil, starting_losses: nil)
    whoosier = Team.find(39)
    whoosier.update(starting_elo: nil, starting_match_count: nil, starting_wins: nil, starting_losses: nil)
    nothin = Team.find(33)
    nothin.update(starting_elo: nil, starting_match_count: nil, starting_wins: nil, starting_losses: nil)
    walkers = Team.find(40)
    walkers.update(starting_elo: nil, starting_match_count: nil, starting_wins: nil, starting_losses: nil)
    grubhub = Team.find(31)
    grubhub.update(starting_elo: nil, starting_match_count: nil, starting_wins: nil, starting_losses: nil)
    wild_tangs = Team.find(41)
    wild_tangs.update(starting_elo: nil, starting_match_count: nil, starting_wins: nil, starting_losses: nil)
    hate_work = Team.find(32)
    hate_work.update(starting_elo: nil, starting_match_count: nil, starting_wins: nil, starting_losses: nil)
    zero_pucks = Team.find(42)
    zero_pucks.update(starting_elo: nil, starting_match_count: nil, starting_wins: nil, starting_losses: nil)
    puck_up = Team.find(36)
    puck_up.update(starting_elo: nil, starting_match_count: nil, starting_wins: nil, starting_losses: nil)

    # Week 1
    time = d_time
    Match.create(away_team: back_that, home_team: tangbang, away_score: 1, home_score: 0, court: Court.find(1), time: time, division: division)
    Match.create(away_team: pbd, home_team: beergeeks, away_score: 0, home_score: 1, court: Court.find(2), time: time, division: division)
    Match.create(away_team: shifty_mother, home_team: binnies, away_score: 1, home_score: 0, court: Court.find(3), time: time, division: division)
    Match.create(away_team: shuffle_state, home_team: butter_yo, away_score: 0, home_score: 1, court: Court.find(4), time: time, division: division)
    Match.create(away_team: skenders, home_team: cannon, away_score: 0, home_score: 1, court: Court.find(5), time: time, division: division)
    Match.create(away_team: usa, home_team: wtf, away_score: 0, home_score: 1, court: Court.find(6), time: time, division: division)
    Match.create(away_team: whoosier, home_team: nothin, away_score: 1, home_score: 0, court: Court.find(7), time: time, division: division)
    Match.create(away_team: walkers, home_team: grubhub, away_score: 0, home_score: 1, court: Court.find(8), time: time, division: division)
    Match.create(away_team: wild_tangs, home_team: hate_work, away_score: 0, home_score: 1, court: Court.find(9), time: time, division: division)
    Match.create(away_team: zero_pucks, home_team: puck_up, away_score: 0, home_score: 1, court: Court.find(10), time: time, division: division)

    # Week 2
    time = d_time + 1.weeks
    Match.create(away_team: zero_pucks, home_team: beergeeks, away_score: 0, home_score: 1, court: Court.find(1), time: time, division: division)
    Match.create(away_team: back_that, home_team: binnies, away_score: 0, home_score: 1, court: Court.find(2), time: time, division: division)
    Match.create(away_team: pbd, home_team: butter_yo, away_score: 0, home_score: 1, court: Court.find(3), time: time, division: division)
    Match.create(away_team: shifty_mother, home_team: cannon, away_score: 1, home_score: 0, court: Court.find(4), time: time, division: division)
    Match.create(away_team: shuffle_state, home_team: wtf, away_score: 0, home_score: 1, court: Court.find(5), time: time, division: division)
    Match.create(away_team: skenders, home_team: nothin, away_score: 0, home_score: 1, court: Court.find(6), time: time, division: division)
    Match.create(away_team: usa, home_team: grubhub, away_score: 0, home_score: 1, court: Court.find(7), time: time, division: division)
    Match.create(away_team: whoosier, home_team: hate_work, away_score: 1, home_score: 0, court: Court.find(8), time: time, division: division)
    Match.create(away_team: walkers, home_team: puck_up, away_score: 1, home_score: 0, court: Court.find(9), time: time, division: division)
    Match.create(away_team: wild_tangs, home_team: tangbang, away_score: 0, home_score: 1, court: Court.find(10), time: time, division: division)

    # Week 3
    time = d_time + 2.weeks
    Match.create(away_team: wild_tangs, home_team: binnies, away_score: 0, home_score: 1, court: Court.find(1), time: time, division: division)
    Match.create(away_team: zero_pucks, home_team: butter_yo, away_score: 0, home_score: 1, court: Court.find(2), time: time, division: division)
    Match.create(away_team: back_that, home_team: cannon, away_score: 1, home_score: 0, court: Court.find(3), time: time, division: division)
    Match.create(away_team: pbd, home_team: wtf, away_score: 0, home_score: 1, court: Court.find(4), time: time, division: division)
    Match.create(away_team: shifty_mother, home_team: nothin, away_score: 1, home_score: 0, court: Court.find(5), time: time, division: division)
    Match.create(away_team: shuffle_state, home_team: grubhub, away_score: 0, home_score: 1, court: Court.find(6), time: time, division: division)
    Match.create(away_team: skenders, home_team: hate_work, away_score: 1, home_score: 0, court: Court.find(7), time: time, division: division)
    Match.create(away_team: usa, home_team: puck_up, away_score: 1, home_score: 0, court: Court.find(8), time: time, division: division)
    Match.create(away_team: whoosier, home_team: tangbang, away_score: 0, home_score: 1, court: Court.find(9), time: time, division: division)
    Match.create(away_team: walkers, home_team: beergeeks, away_score: 0, home_score: 1, court: Court.find(10), time: time, division: division)

    # Week 4
    time = d_time + 3.weeks
    Match.create(away_team: walkers, home_team: butter_yo, away_score: 1, home_score: 0, court: Court.find(1), time: time, division: division)
    Match.create(away_team: wild_tangs, home_team: cannon, away_score: 0, home_score: 1, court: Court.find(2), time: time, division: division)
    Match.create(away_team: zero_pucks, home_team: wtf, away_score: 0, home_score: 1, court: Court.find(3), time: time, division: division)
    Match.create(away_team: back_that, home_team: nothin, away_score: 1, home_score: 0, court: Court.find(4), time: time, division: division)
    Match.create(away_team: pbd, home_team: grubhub, away_score: 0, home_score: 1, court: Court.find(5), time: time, division: division)
    Match.create(away_team: shifty_mother, home_team: hate_work, away_score: 1, home_score: 0, court: Court.find(6), time: time, division: division)
    Match.create(away_team: shuffle_state, home_team: puck_up, away_score: 1, home_score: 0, court: Court.find(7), time: time, division: division)
    Match.create(away_team: skenders, home_team: tangbang, away_score: 0, home_score: 1, court: Court.find(8), time: time, division: division)
    Match.create(away_team: usa, home_team: beergeeks, away_score: 0, home_score: 1, court: Court.find(9), time: time, division: division)
    Match.create(away_team: whoosier, home_team: binnies, away_score: 0, home_score: 1, court: Court.find(10), time: time, division: division)

    # Week 5
    time = d_time + 4.weeks
    Match.create(away_team: usa, home_team: cannon, away_score: 0, home_score: 1, court: Court.find(1), time: time, division: division)
    Match.create(away_team: whoosier, home_team: wtf, away_score: 0, home_score: 1, court: Court.find(2), time: time, division: division)
    Match.create(away_team: walkers, home_team: nothin, away_score: 1, home_score: 0, court: Court.find(3), time: time, division: division)
    Match.create(away_team: wild_tangs, home_team: grubhub, away_score: 1, home_score: 0, court: Court.find(4), time: time, division: division)
    Match.create(away_team: zero_pucks, home_team: hate_work, away_score: 0, home_score: 1, court: Court.find(5), time: time, division: division)
    Match.create(away_team: back_that, home_team: puck_up, away_score: 1, home_score: 0, court: Court.find(6), time: time, division: division)
    Match.create(away_team: pbd, home_team: tangbang, away_score: 0, home_score: 1, court: Court.find(7), time: time, division: division)
    Match.create(away_team: shifty_mother, home_team: beergeeks, away_score: 1, home_score: 0, court: Court.find(8), time: time, division: division)
    Match.create(away_team: shuffle_state, home_team: binnies, away_score: 0, home_score: 1, court: Court.find(9), time: time, division: division)
    Match.create(away_team: skenders, home_team: butter_yo, away_score: 1, home_score: 0, court: Court.find(10), time: time, division: division)

    # Week 6
    time = d_time + 5.weeks
    Match.create(away_team: skenders, home_team: wtf, away_score: 1, home_score: 0, court: Court.find(1), time: time, division: division)
    Match.create(away_team: usa, home_team: nothin, away_score: 1, home_score: 0, court: Court.find(2), time: time, division: division)
    Match.create(away_team: whoosier, home_team: grubhub, away_score: 1, home_score: 0, court: Court.find(3), time: time, division: division)
    Match.create(away_team: walkers, home_team: hate_work, away_score: 1, home_score: 0, court: Court.find(4), time: time, division: division)
    Match.create(away_team: wild_tangs, home_team: puck_up, away_score: 1, home_score: 0, court: Court.find(5), time: time, division: division)
    Match.create(away_team: zero_pucks, home_team: tangbang, away_score: 0, home_score: 1, court: Court.find(6), time: time, division: division)
    Match.create(away_team: back_that, home_team: beergeeks, away_score: 0, home_score: 1, court: Court.find(7), time: time, division: division)
    Match.create(away_team: pbd, home_team: binnies, away_score: 0, home_score: 1, court: Court.find(8), time: time, division: division)
    Match.create(away_team: shifty_mother, home_team: butter_yo, away_score: 1, home_score: 0, court: Court.find(9), time: time, division: division)
    Match.create(away_team: shuffle_state, home_team: cannon, away_score: 0, home_score: 1, court: Court.find(10), time: time, division: division)

    # Week 7
    time = d_time + 6.weeks
    Match.create(away_team: shuffle_state, home_team: nothin, away_score: 0, home_score: 1, court: Court.find(1), time: time, division: division)
    Match.create(away_team: skenders, home_team: grubhub, away_score: 1, home_score: 0, court: Court.find(2), time: time, division: division)
    Match.create(away_team: usa, home_team: hate_work, away_score: 0, home_score: 1, court: Court.find(3), time: time, division: division)
    Match.create(away_team: whoosier, home_team: puck_up, away_score: 0, home_score: 1, court: Court.find(4), time: time, division: division)
    Match.create(away_team: walkers, home_team: tangbang, away_score: 0, home_score: 1, court: Court.find(5), time: time, division: division)
    Match.create(away_team: wild_tangs, home_team: beergeeks, away_score: 0, home_score: 1, court: Court.find(6), time: time, division: division)
    Match.create(away_team: zero_pucks, home_team: binnies, away_score: 1, home_score: 0, court: Court.find(7), time: time, division: division)
    Match.create(away_team: back_that, home_team: butter_yo, away_score: 1, home_score: 0, court: Court.find(8), time: time, division: division)
    Match.create(away_team: pbd, home_team: cannon, away_score: 0, home_score: 1, court: Court.find(9), time: time, division: division)
    Match.create(away_team: shifty_mother, home_team: wtf, away_score: 1, home_score: 0, court: Court.find(10), time: time, division: division)

    # Week 8
    time = d_time + 7.weeks
    Match.create(away_team: shifty_mother, home_team: grubhub, away_score: 1, home_score: 0, court: Court.find(1), time: time, division: division)
    Match.create(away_team: shuffle_state, home_team: hate_work, away_score: 1, home_score: 0, court: Court.find(2), time: time, division: division)
    Match.create(away_team: skenders, home_team: puck_up, away_score: 0, home_score: 1, court: Court.find(3), time: time, division: division)
    Match.create(away_team: usa, home_team: tangbang, away_score: 0, home_score: 1, court: Court.find(4), time: time, division: division)
    Match.create(away_team: whoosier, home_team: beergeeks, away_score: 0, home_score: 1, court: Court.find(5), time: time, division: division)
    Match.create(away_team: walkers, home_team: binnies, away_score: 0, home_score: 1, court: Court.find(6), time: time, division: division)
    Match.create(away_team: wild_tangs, home_team: butter_yo, away_score: 0, home_score: 1, court: Court.find(7), time: time, division: division)
    Match.create(away_team: zero_pucks, home_team: cannon, away_score: 0, home_score: 1, court: Court.find(8), time: time, division: division)
    Match.create(away_team: back_that, home_team: wtf, away_score: 0, home_score: 1, court: Court.find(9), time: time, division: division)
    Match.create(away_team: pbd, home_team: nothin, away_score: 1, home_score: 0, court: Court.find(10), time: time, division: division)

    # Monday 7:30

    Match.recalculate_all_elo
  end
end
