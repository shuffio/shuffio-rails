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

  private

  def default_values
    self.frames ||= []
  end
end
