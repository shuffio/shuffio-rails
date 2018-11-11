Elo.configure do |config|
  # Every player starts with a rating of 1000
  config.default_rating = 1000

  # A player is considered a pro, when he/she has more than 2400 points
  # TODO: we should store Team.pro? when this triggers
  config.pro_rating_boundry = 2400

  # A player is considered a new, when he/she has played less than 9 games
  config.starter_boundry = 9
end
