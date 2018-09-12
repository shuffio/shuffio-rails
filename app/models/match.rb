class Match < ApplicationRecord
  require 'elo'

  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'

  after_create :calculate_elo

  # TODO: home team and away team must be different
  # TODO: if league, validate both teams in same division

  def calculate_elo
    return unless counts_toward_elo
    throw 'score required for match' unless home_score && away_score

    # TODO: if date < latest match, calculate all of those ELOs as well, as this busts cache

    home_elo = ::Elo::Player.new(rating: home_team.elo_cache)
    away_elo = ::Elo::Player.new(rating: home_team.elo_cache)

    if home_score > away_score
      home_elo.wins_from(away_elo)
    elsif away_score > home_score
      away_elo.wins_from(home_elo)
    else
      throw 'score cannot be equal' if home_score == away_score
    end

    home_team.update(elo_cache: home_elo.rating)
    away_team.update(elo_cache: away_elo.rating)
  end
end
