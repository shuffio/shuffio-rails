class Match < ApplicationRecord
  require 'elo'

  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'
  belongs_to :division, optional: true

  after_create :calculate_elo

  # TODO: home team and away team must be different
  # TODO: if league, validate both teams in same division

  def teams
    [away_team, home_team]
  end

  def season
    division.season
  end

  def winner
    return nil if home_score == away_score
    home_score > away_score ? home_team : away_team
  end

  def calculate_elo
    return unless counts_toward_elo
    throw 'score required for match' unless home_score && away_score

    # TODO: if date < latest match, calculate all of those ELOs as well, as this busts cache

    home_elo = ::Elo::Player.new(rating: home_team.elo_cache)
    away_elo = ::Elo::Player.new(rating: away_team.elo_cache)

    if home_score > away_score
      home_elo.wins_from(away_elo)
    elsif away_score > home_score
      away_elo.wins_from(home_elo)
    end

    unless home_score == away_score
      home_team.update(previous_elo: home_team.elo_cache)
      away_team.update(previous_elo: away_team.elo_cache)
      home_team.update(elo_cache: home_elo.rating)
      away_team.update(elo_cache: away_elo.rating)
    end
  end

  def self.recalculate_all_elo
    Team.reset_all_elo

    Match.all.order(:time, :id).each do |m|
      m.calculate_elo
    end

    Team.all.each { |t| t.reset_previous_elo }
  end
end
