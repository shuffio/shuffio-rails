class Tournament < ApplicationRecord
  belongs_to :location
  has_many :tournament_groups
  has_many :tournament_rounds, through: :tournament_groups
  has_many :matches, through: :tournament_rounds

  def teams
    tournament_groups.map(&:teams).flatten.uniq
  end

  def bracket_meta
    {
      id: id,
      name: name,
      start_time: start_time, # UTC
      end_time: end_time, # UTC
      uri: uri,
      format: format,
      description: description,
      tournament_groups: tournament_groups.map(&:bracket_meta)
    }
  end
end
