class Season < ApplicationRecord
  has_many :divisions
  has_many :teams, through: :divisions
  has_many :matches, through: :divisions

  def latest?
    Season.order(:start_date).last == self
  end

  def started?
    start_date.past?
  end
end
