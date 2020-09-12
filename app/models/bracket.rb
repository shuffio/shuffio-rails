class Bracket < ApplicationRecord
  belongs_to :user
  belongs_to :tournament_group

  validates_uniqueness_of :user, scope: :tournament_group

  # this could probably be done with a manual intermediate table and model
  # but this is a good comprimise for now
  # match_data is a JSON hash of { 'match_id': guessed_winning_team_id }
  validate :valid_match_data

  # TODO: validate we are currently bewteen tournament_group bracket_start and bracket_stop... and make those exist
  # TODO: tests

  def match_guess_correct?(match)
    raise 'Match object needed' unless match
    raise 'Match not in Bracket tournament_group' unless tournament_group.matches.include?(match)
    raise 'Match not in Bracket match_data' unless match_data.keys.include?(match.id.to_s)

    return false unless match.winner

    match.winner.id == match_data[match.id.to_s]
  end

  def points
    points = 0

    match_data.each do |match_id_s, _winner_id|
      m = Match.find(match_id_s.to_i)

      next unless m.tournament_round

      points += m.tournament_round.points if match_guess_correct?(m)
    end

    points
  end

  def complete?
    tournament_group.matches.each do |m|
      return false unless match_data[m.id.to_s]
    end

    true
  end

  def potential_teams(_match)
    # TODO: we need a method to return the potential teams for a match
    # this is based either on real teams in the first round
    # or the user's selection in previous rounds
    # For now return shuff it and the butts
    [
      Team.find(87),
      Team.find(95)
    ]
  end

  private

  def valid_match_data
    errors.add(:match_data, 'must be a hash') unless match_data.is_a?(Hash)

    match_data.each do |match_id_s, winner_id|
      errors.add(:match_data, 'Match IDs must be strings') unless match_id_s.class == 'String'
      errors.add(:match_data, 'Winner IDs must be integers') unless winner_id.class == 'Integer'

      begin
        Match.find(match_id_s.to_i)
      rescue ActiveRecord::RecordNotFound
        errors.add(:match_data, 'must have keys of existing Match IDs')
      end

      begin
        Team.find(winner_id)
      rescue ActiveRecord::RecordNotFound
        errors.add(:match_data, 'must have values of existing Team IDs')
      end
    end
  end
end
