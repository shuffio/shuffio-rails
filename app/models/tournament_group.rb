class TournamentGroup < ApplicationRecord
  belongs_to :tournament
  has_many :tournament_rounds
  has_many :matches, through: :tournament_rounds
  has_many :teams, through: :tournament_rounds

  def teams
    tournament_rounds.map(&:teams).flatten.uniq
  end
end
