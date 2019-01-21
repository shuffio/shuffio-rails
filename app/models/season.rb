class Season < ApplicationRecord
  has_many :divisions
  has_many :teams, through: :divisions
  has_many :matches, through: :divisions
  belongs_to :champion, class_name: 'Team'

  def latest?
    Season.order(:start_date).last == self
  end

  def started?
    start_date.past?
  end

  def self.current
    Season.order(start_date: :desc).each do |s|
      return s unless s.start_date.future?
    end
  end
end
