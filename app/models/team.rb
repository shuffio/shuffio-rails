class Team < ApplicationRecord
  after_create :set_default_elo

  def set_default_elo
    self.elo_cache = 1500
    save
  end

end
