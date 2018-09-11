class Team < ApplicationRecord
  after_create :set_default_elo
  has_and_belongs_to_many :divisions

  def set_default_elo
    self.elo_cache = 1500
    save
  end

end
