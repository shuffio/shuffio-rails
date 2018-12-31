class Bracket < ApplicationRecord
  has_many :matches, dependent: :nullify

  def match_array
    JSON.parse(match_id_blob).map { |r| r.map { |m| Match.find(m) } }
  end

  def teams
    first_round = match_array.first
    first_round.map { |m| [m.away_team.display_name, m.home_team.display_name] }
  end

  def results
    match_array.map { |r| r.map { |m| [m.away_score, m.home_score] } }
  end
end
