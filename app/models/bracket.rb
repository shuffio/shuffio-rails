class Bracket < ApplicationRecord
  belongs_to :user
  belongs_to :tournament_group

  validates_uniqueness_of :user, scope: :tournament_group

  # this could probably be done with a manual intermediate table and model
  # but this is a good comprimise for now
  # match_data is a JSON hash of { 'match_id': guessed_winning_team_id }
  validate :valid_match_data
  validate :valid_bracket_enabled
  validate :valid_bracket_time

  # TODO: validate we are currently bewteen tournament_group bracket_start and bracket_stop... and make those exist
  # TODO: tests

  def match_guess_correct?(match)
    raise 'Match object needed' unless match
    raise 'Match not in Bracket tournament_group' unless tournament_group.matches.include?(match)
    raise 'Match not in Bracket match_data' unless match_data.keys.include?(match.id.to_s)

    return false unless match.winner

    match.winner.id == match_data[match.id.to_s]
  end

  def match_points_s(match)
    return '' unless match.winner
    return '0' unless match_guess_correct?(match)

    match.tournament_round.points.to_s
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

  def potential_teams(match)
    # Find match in tournament_round
    raise 'Match not in Bracket tournament_group' unless tournament_group.matches.include?(match)
    raise 'Match missing tournament_order field' unless match.tournament_order

    # If we're in the first round, this should just be that match's teams
    return [match.away_team, match.home_team] if match.tournament_round.number == 1

    # Otherwise, we need to source the user's picks from the previous round
    last_round = match.tournament_round.previous

    # Find the matches from the previous round that the winners carry over from into this match. rough math:
    # round 2 -> round 1
    # 1: [1, 2]
    # 2: [3, 4]
    # 3: [5, 6]
    # 4: [7, 8]
    match1 = Match.find_by(tournament_round: last_round, tournament_order: match.tournament_order * 2 - 1)
    match2 = Match.find_by(tournament_round: last_round, tournament_order: match.tournament_order * 2)

    # Ensure they've made the picks needed to determine this
    raise 'Bracket is missing pick from previous round' unless match_data[match1.id.to_s] && match_data[match2.id.to_s]

    # Return the user's picks for the winners of the previous matches
    [
      Team.find(match_data[match1.id.to_s]),
      Team.find(match_data[match2.id.to_s])
    ]
  end

  def round_complete?(round)
    round.matches.each do |m|
      return false unless match_data.keys.include?(m.id.to_s)
    end

    true
  end

  def next_round
    tournament_group.tournament_rounds.each do |tr|
      return tr unless round_complete?(tr)
    end

    nil
  end

  def pick_for_match(match)
    raise 'Match object needed' unless match
    raise 'Match not in Bracket tournament_group' unless tournament_group.matches.include?(match)
    raise 'Match not in Bracket match_data' unless match_data.keys.include?(match.id.to_s)

    Team.find(match_data[match.id.to_s])
  end

  def self.completed_count
    Bracket.count(&:complete?)
  end

  def self.any_available?
    TournamentGroup.all.find_each do |tg|
      return true if tg.bracket_pick_available?
    end

    false
  end

  private

  def valid_match_data
    errors.add(:match_data, 'must be a hash') unless match_data.is_a?(Hash)

    match_data.each do |match_id_s, winner_id|
      errors.add(:match_data, 'Match IDs must be strings') unless match_id_s.class == String
      errors.add(:match_data, 'Winner IDs must be integers') unless winner_id.class == Integer

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

  def valid_bracket_enabled
    errors.add(:tournament_group, 'must have bracket_start_time and bracket_end_time') unless tournament_group.bracket_enabled?
  end

  def valid_bracket_time
    errors.add(:tournament_group, 'must have bracket_start_time and bracket_end_time within range of now') unless tournament_group.bracket_pick_available?
  end
end
