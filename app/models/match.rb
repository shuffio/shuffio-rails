class Match < ApplicationRecord
  require 'elo'

  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'
  belongs_to :division, optional: true
  belongs_to :court, optional: true
  has_many :games, dependent: :nullify

  # TODO: Fix callback to work on updates
  after_create :calculate_elo

  # TODO: home team and away team must be different
  # TODO: if league, validate both teams in same division

  def teams
    [away_team, home_team]
  end

  delegate :season, to: :division

  def winner
    return nil if home_score == away_score

    home_score > away_score ? home_team : away_team
  end

  def calculate_elo
    return unless counts_toward_elo

    throw 'score required for match' unless home_score && away_score

    # TODO: if date < latest match, calculate all of those ELOs as well, as this busts cache

    home_elo = ::Elo::Player.new(rating: home_team.elo_cache, games_played: home_team.match_count)
    away_elo = ::Elo::Player.new(rating: away_team.elo_cache, games_played: away_team.match_count)

    if home_score > away_score
      home_elo.wins_from(away_elo)
    elsif away_score > home_score
      away_elo.wins_from(home_elo)
    end

    # Save ELO to Match
    self.home_old_elo = home_team.elo_cache
    self.away_old_elo = away_team.elo_cache
    self.home_new_elo = home_elo.rating
    self.away_new_elo = away_elo.rating
    save

    # Save ELO to Teams
    unless home_score == away_score
      home_team.update(previous_elo: home_team.elo_cache)
      away_team.update(previous_elo: away_team.elo_cache)
      home_team.update(elo_cache: home_elo.rating)
      away_team.update(elo_cache: away_elo.rating)
    end
  end

  def formatted_date
    time.in_time_zone('America/Chicago').strftime("%b #{time.in_time_zone('America/Chicago').day.ordinalize} %Y")
  end

  def formatted_datetime
    time.in_time_zone('America/Chicago').strftime("%b #{time.in_time_zone('America/Chicago').day.ordinalize} %Y, %-l:%M%P")
  end

  def formatted_time
    time.in_time_zone('America/Chicago').strftime('%-l:%M%P')
  end

  def team_result(id)
    return nil unless [home_team_id, away_team_id].include?(id)

    return 'tied' if home_score == away_score

    return 'won' if home_team_id == id && home_score > away_score
    return 'won' if away_team_id == id && away_score > home_score

    return 'lost' if home_team_id == id && home_score < away_score
    return 'lost' if away_team_id == id && away_score < home_score
  end

  def team_info(id)
    if home_team_id == id
      {
        opponent: away_team,
        result: team_result(id),
        old_elo: home_old_elo,
        new_elo: home_new_elo
      }
    elsif away_team_id == id
      {
        opponent: home_team,
        result: team_result(id),
        old_elo: away_old_elo,
        new_elo: away_new_elo
      }
    end
  end

  def tied?
    home_score == away_score
  end

  def matchup_summary
    away_record = away_team.record
    home_record = home_team.record

    [
      [location, away_team.name, home_team.name],
      ['ELO', away_team.elo_cache, home_team.elo_cache],
      ['Record', "#{away_record[:wins]}-#{away_record[:losses]}\t", "#{home_record[:wins]}-#{home_record[:losses]}\t"]
    ]
  end

  def export_summary
    [
      id,
      time.in_time_zone('America/Chicago').iso8601,
      location,
      division ? division.name : '',
      comment,
      home_team.name,
      away_team.name,
      winner ? winner.name : '',
      home_score,
      away_score,
      home_old_elo,
      home_new_elo,
      away_old_elo,
      away_new_elo
    ]
  end

  def self.recalculate_all_elo
    # Disable logging
    old_logger = ActiveRecord::Base.logger
    ActiveRecord::Base.logger.level = 1

    Team.reset_all_elo

    Match.all.order(:time, :id).each(&:calculate_elo)

    # Set logging back to old level
    ActiveRecord::Base.logger = old_logger
  end
end
