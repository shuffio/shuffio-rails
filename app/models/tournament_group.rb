class TournamentGroup < ApplicationRecord
  belongs_to :tournament
  has_many :tournament_rounds, -> { order(:number) }
  has_many :matches, through: :tournament_rounds
  has_many :teams, through: :tournament_rounds

  def teams
    tournament_rounds.map(&:teams).flatten.uniq
  end

  def bracket_meta
    {
      id: id,
      name: name,
      tournament_rounds: tournament_rounds.map(&:bracket_meta)
    }
  end

  def bracket_enabled?
    return false unless bracket_start_time
    return false unless bracket_end_time

    true
  end

  def bracket_pick_available?
    return false unless bracket_enabled?
    return false unless bracket_start_time && bracket_start_time.past?
    return false unless bracket_end_time && bracket_end_time.future?

    true
  end

  def bracket_allowed?(user = nil)
    return false unless bracket_pick_available?
    return false if user && Bracket.find_by(user: user, tournament_group: self)

    true
  end
end
