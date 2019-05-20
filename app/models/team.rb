class Team < ApplicationRecord
  after_create :set_default_elo

  has_and_belongs_to_many :divisions
  has_many :seasons, through: :divisions
  has_many :championships, class_name: 'Season', foreign_key: 'champion_id'

  validates :name, presence: true

  around_update :check_for_rename

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

  def season_record(season = Season.latest)
    record(matches.where('division_id IN (?)', season.divisions.ids))
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

  def current_division
    divisions.find_by(season: Season.latest)
  end

  def missing_results
    matches.where(home_score: 0, away_score: 0).where('time < ?', 1.day.ago)
  end

  def missing_results?
    missing_results.any?
  end

  def playoff_appearances
    # TODO: we need to finish the brackets branch and make this relational
    playoffs = []
    matches.where('comment LIKE ? AND comment NOT LIKE ?', '%Playoffs%', '%Consolation Bracket').find_each do |m|
      season = m.comment.split(/ - /)[0]
      playoffs.push(season) unless playoffs.include?(season)
    end

    playoffs
  end

  def furthest_playoff_run
    rounds = [
      '',
      'Group Play',
      'Round of 16',
      'Round of 8',
      'Semi-Finals',
      '3rd Place Game',
      'Finals'
    ]

    furthest_round = 0

    matches.where('comment LIKE ?', '%Playoffs%').find_each do |m|
      round_num = rounds.index(m.comment.split(/ - /)[1])
      furthest_round = round_num if round_num && round_num > furthest_round
    end

    rounds[furthest_round]
  end

  def summary_info
    [
      name,
      elo_cache,
      seasons.count,
      "#{season_record[:wins]}-#{season_record[:losses]}",
      playoff_appearances.count,
      furthest_playoff_run
    ]
  end

  def self.summary_csv
    require 'csv'

    attributes = [
      'Name',
      'ELO',
      'Number of Seasons',
      'Current Season Record',
      'Number of Playoffs',
      'Furthest Playoff Run'
    ]

    CSV.generate(headers: true) do |csv|
      csv << attributes

      Team.all.order('elo_cache DESC').each do |t|
        csv << t.summary_info
      end
    end
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

  def self.find_from_la_csv(csv_data)
    require 'csv'

    # Parse CSV data
    csv = CSV.new(csv_data, headers: true, header_converters: :symbol)
    teams = csv.to_a.map { |row| row.to_hash.slice(:name, :captain) }

    # Find existing team
    teams.each do |t|
      if (existing_team = Team.find_by(captain: t[:captain]))
        t[:existing_team_id] = existing_team.id
      elsif (existing_team = Team.find_by(name: t[:name]))
        t[:existing_team_id] = existing_team.id
      end
    end

    teams
  end

  private

  def check_for_rename
    if name_changed?
      self.former_names = if former_names
                            "#{name_was}, #{former_names}"
                          else
                            name_was
                          end
    end

    yield
  end
end
