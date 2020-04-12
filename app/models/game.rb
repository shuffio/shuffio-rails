class Game < ApplicationRecord
  belongs_to :match
  belongs_to :yellow_team, class_name: 'Team', optional: true
  belongs_to :black_team, class_name: 'Team', optional: true

  enum game_type: { standard_singles: 0, standard_doubles: 1, palms_singles: 2, palms_doubles: 3 }

  validate :frames_or_points?
  validate :valid_game_number?
  validate :points_cannot_tie?

  after_initialize :default_values

  # TODO: reject frames with only one score, for example [[0, 0], [8, nil]]

  def complete?
    return false unless frames # return quickly if frames is nil
    return false unless frames.size.positive?

    if max_frames && max_points
      # frame and point game, whichever comes first
      return false if (frames.count < max_frames) && (frames.last[0] < max_points) && (frames.last[1] < max_points)
    elsif max_frames
      # frame game
      return false if frames.count < max_frames # false if there are frames to go
    elsif max_points
      # point game
      # TODO: there is some complexity around the game ending when above max points, but still being in a tie that we're not accounting for yet
      return false if (frames.last[0] < max_points) && (frames.last[1] < max_points)
    end

    return false if (frames.last[0] == frames.last[1]) && !allow_ties # false if game tied and ties not allowed

    unless max_points
      return false unless at_game_end_boundary? # false if there are still frames remaining
    end

    true
  end

  def next_frame
    frames.count + 1
  end

  def next_hammer
    Game.hammer_for_frame(next_frame, game_type)
  end

  def game_end_boundary
    return 4 if standard_doubles?

    2
  end

  def at_game_end_boundary?
    return false if frames.count.zero?

    (frames.count % game_end_boundary).zero?
  end

  def frames_with_meta(number_frames = 8, padding = !complete?)
    input_frames = frames.dup

    # Add padding (so that you see the next frame number)
    input_frames.push([nil, nil]) if padding

    # If fewer than needed frames, pad it
    input_frames = input_frames.fill([nil, nil], input_frames.length, number_frames - input_frames.length) if input_frames.size < number_frames

    # If frames odd, pad it once
    input_frames.push([nil, nil]) if input_frames.size.odd?

    # Inject frame number and hammer
    frames_hash = input_frames.map.with_index do |f, i|
      {
        number: i + 1,
        hammer: Game.hammer_for_frame(i + 1, game_type),
        yellow_score: f[0],
        black_score: f[1]
      }
    end

    # return last X frames
    frames_hash.last(number_frames)
  end

  def self.hammer_for_frame(frame_number = 1, type = 'standard_singles')
    raise 'invalid frame number' unless frame_number.positive?

    case type
    when 'standard_singles'
      return 'yellow' if frame_number.even?
      return 'black' if frame_number.odd?
    when 'standard_doubles'
      case frame_number % 4
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
      case frame_number % 4
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

  def winner
    return nil unless complete?

    return yellow_team if frames.last[0] > frames.last[1]
    return black_team if frames.last[1] > frames.last[0]

    nil
  end

  def series_score
    yellow = 0
    black = 0

    match.games.each do |g|
      yellow += 1 if g.winner == yellow_team
      black += 1 if g.winner == black_team
    end

    [yellow, black]
  end

  private

  def default_values
    self.frames ||= []
  end

  def frames_or_points?
    errors.add(:base, 'must have max_points or max_frames') unless max_points || max_frames
  end

  def valid_game_number?
    errors.add(:number, 'must be positive') unless number && number.positive?
  end

  def points_cannot_tie?
    return if max_frames

    errors.add(:base, 'point games cannot tie') if max_points && allow_ties
  end
end
