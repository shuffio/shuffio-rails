class Game < ApplicationRecord
  belongs_to :match
  belongs_to :yellow_team, class_name: 'Team', optional: true
  belongs_to :black_team, class_name: 'Team', optional: true

  # TODO: game must be 1-3
end
