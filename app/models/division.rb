class Division < ApplicationRecord
  belongs_to :season
  has_and_belongs_to_many :teams
  has_many :matches
end
