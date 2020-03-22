class Court < ApplicationRecord
  belongs_to :location
  has_and_belongs_to_many :tournament_rounds

  def full_name
    "#{location.name} #{name}"
  end

  def number
    court = name.split(/ /).last.to_i
    return court if court.positive?

    nil
  end
end
