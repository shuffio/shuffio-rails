class Court < ApplicationRecord
  belongs_to :location

  def full_name
    "#{location.name} #{name}"
  end
end
