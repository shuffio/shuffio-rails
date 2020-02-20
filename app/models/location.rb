class Location < ApplicationRecord
  has_many :courts
  has_many :touraments
end
