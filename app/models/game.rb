class Game < ApplicationRecord
  belongs_to :match
  belongs_to :yellow_team, class_name: 'Team', optional: true
  belongs_to :black_team, class_name: 'Team', optional: true
  after_initialize :default_values

  # TODO: game must be 1-3

  def eight_frames
    return frames if frames.size == 8

    # '' actually has hidden unicode
    return frames.fill(['​', '​'], frames.length, 8 - frames.length) if frames.size < 8

    # else more than 8 frames, return last 8 if even, last 7 + padding if odd
    return frames.last(8) if frames.size.even?

    frames.fill(['​', '​'], frames.length, 1).last(8)
  end

  def isa_frames
    return frames.fill(['​', '​'], frames.length, 9 - frames.length) if frames.size <= 8

    frames.fill(['​', '​'], frames.length, 17 - frames.length).drop(8)
  end

  def completed?(game_frames = 8, allow_ties = false)
    return false unless frames # return quickly if frames is nil
    return false if frames.count < game_frames # false if
    return false if (frames.last[0] == frames.last[1]) && !allow_ties # false if game tied and ties not allowed
    return false if frames.count.odd? # false if there are still frames remaining

    true
  end

  def hammer(type = 'palms')
    # TODO: move the type to the model and do validations

    if type == 'isa'
      return 'black' if frames.count.even?
      return 'yellow' if frames.count.odd?
    elsif type == 'palms'
      case frames.count % 4
      when 0
        'black'
      when 1
        'yellow'
      when 2
        'yellow'
      when 3
        'black'
      end
    else
      raise 'invalid game type'
    end
  end

  private

  def default_values
    self.frames ||= []
  end
end
