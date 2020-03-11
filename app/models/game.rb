class Game < ApplicationRecord
  belongs_to :match
  belongs_to :yellow_team, class_name: 'Team', optional: true
  belongs_to :black_team, class_name: 'Team', optional: true

  # TODO: validate this enum, and everything else
  enum game_type: { standard_singles: 0, standard_doubles: 1, palms_singles: 2, palms_doubles: 3 }

  validate :frames_or_points?
  validate :valid_game_number?

  after_initialize :default_values

  # TODO: re-work views to not need this method, probably in controller?
  def eight_frames
    return frames if frames.size == 8

    # '' actually has hidden unicode
    return frames.fill(['​', '​'], frames.length, 8 - frames.length) if frames.size < 8

    # else more than 8 frames, return last 8 if even, last 7 + padding if odd
    return frames.last(8) if frames.size.even?

    frames.fill(['​', '​'], frames.length, 1).last(8)
  end

  # TODO: re-work views to not need this method, probably in controller?
  def isa_frames
    return frames.fill(['​', '​'], frames.length, 9 - frames.length) if frames.size <= 8

    frames.fill(['​', '​'], frames.length, 17 - frames.length).drop(8)
  end

  def completed?
    return false unless frames # return quickly if frames is nil

    if max_frames && max_points
      # frame and point game, whichever comes first
      return false if (frames.count < max_frames) && (frames.last[0] < max_points) && (frames.last[1] < max_points)
    elsif max_frames
      # frame game
      return false if frames.count < max_frames # false if there are frames to go
    elsif max_points
      # point game
      return false if (frames.last[0] < max_points) && (frames.last[1] < max_points)
    end

    return false if (frames.last[0] == frames.last[1]) && !allow_ties # false if game tied and ties not allowed

    # TODO: this makes sense, right? time to write some tests
    return false unless max_points && at_game_end_boundary? # false if there are still frames remaining

    true
  end

  def next_hammer
    frame_count = frames.count + 1

    case game_type
    when 'standard_singles'
      return 'yellow' if frames.count.odd?
      return 'black' if frames.count.even?
    when 'standard_doubles'
      case frame_count % 4
      when 1
        'black'
      when 2
        'black'
      when 3
        'yellow'
      when 0
        'yellow'
      end
    when 'palms_singles', 'palms_doubles'
      case frame_count % 4
      when 1
        'black'
      when 2
        'yellow'
      when 3
        'yellow'
      when 0
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

  def frames_or_points?
    return true if max_points
    return true if max_frames

    false
  end

  def valid_game_number?
    return true if number && number.positive?

    false
  end

  def game_end_boundary
    return 4 if Game.last.standard_doubles?

    2
  end

  def at_game_end_boundary?
    return false if frames.count.zero?

    (frames.count % Game.last.game_end_boundary).zero?
  end
end
