class Team < ApplicationRecord
  after_create :set_default_elo

  has_and_belongs_to_many :divisions
  has_many :seasons, through: :divisions
  has_many :championships, class_name: 'Season', foreign_key: 'champion_id'

  def set_default_elo
    self.elo_cache = starting_elo || 1000
    self.previous_elo = starting_elo || 1000
    save
  end

  def matches
    Match.where(away_team_id: id).or(Match.where(home_team_id: id))
  end

  def match_count
    return matches.count unless starting_match_count

    matches.count + starting_match_count
  end

  def record(team_matches = nil)
    if team_matches
      record = { wins: 0, losses: 0 }
    else
      record = { wins: starting_wins, losses: starting_losses }
      team_matches = matches
    end

    return record unless team_matches.any?

    team_matches.each do |m|
      if m.winner.nil?
        # do nothing
      elsif m.winner == self
        record[:wins] += 1
      else
        record[:losses] += 1
      end
    end

    record
  end

  def league_record(division = nil)
    # If Division specified, return record from this division
    # Else, return record from _all_ division games
    division ? record(matches.where(division: division)) : record(matches.where.not(division: nil))
  end

  def self.reset_all_elo
    Team.all.find_each(&:set_default_elo)
  end

  def display_name
    short_name || name
  end

  def logo_uri
    image_uri || ActionController::Base.helpers.image_url('tangs-biscuit-padded.png')
  end

  def color
    ColorGenerator.new(saturation: 0.75, value: 1.0, seed: id).create_hex
  end

  def champion?
    championships.any?
  end

  def rename(new_name)
    self.former_names = if former_names
                          "#{name}, #{former_names}"
                        else
                          name
                        end

    self.name = new_name
    save
  end

  def current_division
    divisions.find_by(season: Season.latest)
  end

  def missing_results
    matches.where(home_score: 0, away_score: 0).where('time < ?', 1.day.ago)
  end

  def missing_results?
    missing_results.any?
  end

  # Expects Array of Hashes like { team: team_obj, wins: 7, losses: 1 }
  # It returns in the same format
  def self.sort_by_rank(teams)
    output = []

    # Group and Sort teams by # of wins descending
    # teams_by_win = {2: [], 1: [], 0: []}
    teams_by_win = teams.group_by { |t| t[:wins] }.sort_by { |k, _v| k }.reverse
    teams_by_win.each do |win, win_team_array|
      # Now group and sort the "win" group by # of losses
      teams_by_loss = win_team_array.group_by { |t| t[:losses] }.sort_by { |k, _v| k }
      teams_by_loss.each do |loss, loss_team_array|
        # Now sort within win/loss group by ELO descending
        teams_by_elo = loss_team_array.sort_by { |t| t[:team].elo_cache }.reverse

        teams_by_elo.each do |t|
          output.push(
            team: t[:team],
            wins: win,
            losses: loss
          )
        end
      end
    end

    output
  end
end
