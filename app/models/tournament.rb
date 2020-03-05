class Tournament < ApplicationRecord
  belongs_to :location
  has_many :tournament_groups
  has_many :tournament_rounds, through: :tournament_groups
  has_many :matches, through: :tournament_rounds

  def teams
    tournament_groups.map(&:teams).flatten.uniq
  end
end
