class LiveEvent < ApplicationRecord
  belongs_to :left_game, class_name: 'Game', optional: true
  belongs_to :right_game, class_name: 'Game', optional: true

  def left_match
    left_game.match
  end

  def right_match
    right_game.match
  end

  def left_description
    left_match.comment
  end

  def right_description
    right_match.comment
  end

  def left_court_number
    return nil unless left_match.location

    court = left_match.location.split(/ /).last.to_i
    return court if court.positive?

    nil
  end

  def right_court_number
    return nil unless right_match.location

    court = right_match.location.split(/ /).last.to_i
    return court if court.positive?

    nil
  end
end
