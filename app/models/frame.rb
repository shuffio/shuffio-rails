class Frame < ApplicationRecord
  belongs_to :game
  has_many :frames

  belongs_to :yellow_player, class_name: 'User'
  belongs_to :black_player, class_name: 'User'

  # belongs_to :yellow_team
  # belongs_to :black_team
end
