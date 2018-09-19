class Team < ApplicationRecord
  after_create :set_default_elo

  has_and_belongs_to_many :divisions
  has_many :seasons, through: :divisions

  def matches
    Match.where(away_team_id: id).or(Match.where(home_team_id: id))
  end

  def set_default_elo
    self.elo_cache = starting_elo || 1500
    save
  end

end
