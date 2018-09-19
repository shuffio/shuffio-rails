class Season < ApplicationRecord
  has_many :divisions
  has_many :teams, through: :divisions
  has_many :matches, through: :divisions
end
