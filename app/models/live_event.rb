class LiveEvent < ApplicationRecord
  belongs_to :left_game, class_name: 'Game', optional: true
  belongs_to :right_game, class_name: 'Game', optional: true
end
