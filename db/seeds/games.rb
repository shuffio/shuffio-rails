home = Team.find_by(name: 'Shuff It, Shuff It Real Good!')
away = Team.find_by(name: 'Tu-Tang Clan')

m = Match.create(home_team: home, away_team: away, home_score: 0, away_score: 0)

left_game = Game.create(
  match: m,
  number: 1,
  yellow_team: away,
  black_team: home,
  frames: [[0, 0], [0, 0], [0, -2], [0, -2], [0, -2], [7, -2], [7, -2], [7, -2]]
)

right_game = Game.create(
  match: m,
  number: 2,
  yellow_team: home,
  black_team: away,
  frames: [[7, 0], [7, 0], [14, 7], [14, 14], [14, 24], [21, 24], [21, 24], [21, 24]]
)

Game.create(match: m, number: 3, yellow_team: away, black_team: home, frames: [])

LiveEvent.create(left_game: left_game, right_game: right_game)
