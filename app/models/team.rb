class Team < ApplicationRecord
  after_create :set_default_elo

  has_and_belongs_to_many :divisions
  has_many :seasons, through: :divisions

  def set_default_elo
    self.elo_cache = starting_elo || 1000
    self.previous_elo = starting_elo || 1000
    save
  end

  def matches
    Match.where(away_team_id: id).or(Match.where(home_team_id: id))
  end

  def record(team_matches = matches)
    record = { wins: 0, losses: 0 }

    return record unless team_matches.any?

    team_matches.each do |m|
      if m.winner.nil?
        # do nothing
      elsif m.winner == self
        record[:wins] += 1
      else
        record[:losses] +=1
      end
    end

    record
  end

  def reset_previous_elo
    return if seasons.last == Season.all.last

    self.previous_elo = elo_cache
    save
  end

  def league_record(division = nil)
    # If Division specified, return record from this division
    # Else, return record from _all_ division games
    division ? record(matches.where(division: division)) : record(matches.where.not(division: nil))
  end

  def self.reset_all_elo
    Team.all.each do |t|
      t.set_default_elo
    end
  end
end
