class Division < ApplicationRecord
  belongs_to :season
  has_and_belongs_to_many :teams
  has_many :matches

  def match_time_for_week(week)
    day = season.start_date
    day += 1.day if day_of_week == 2

    (week - 1).times do
      day += 1.week
    end

    Time.find_zone('America/Chicago').parse("#{day} #{time}")
  end

  def matches_for_week(week)
    matches.where(time: match_time_for_week(week)).order(:location)
  end

  def report_for_week(week)
    output = "\e[36mResults (winner underlined):\e[0m\n"
    output += "#{season.name} - #{name} Division\n"
    output += match_time_for_week(week).in_time_zone('America/Chicago').to_s + "\n\n"

    matches_for_week(week).each do |m|
      output += "#{m.id}\t"
      output += "#{m.location}\t"
      output += "\e[4m" if m.away_score > m.home_score
      output += m.away_team.name + ' (A)'
      output += "\e[24m" if m.away_score > m.home_score
      output += ' vs. '
      output += "\e[4m" if m.home_score > m.away_score
      output += m.home_team.name + ' (H)'
      output += "\e[24m" if m.home_score > m.away_score
      output += "\n"
    end

    output
  end

  def sorted_teams
    return Division.frozen_id_to_team(JSON.parse(final_standings)) if final_standings

    output = []

    # Group and Sort teams by # of wins descending
    # teams_by_win = {2: [], 1: [], 0: []}
    teams_by_win = teams.group_by { |t| t.league_record(self)[:wins] }.sort_by { |k, _v| k }.reverse
    teams_by_win.each do |win, win_team_array|
      # Now group and sort the "win" group by # of losses
      teams_by_loss = win_team_array.group_by { |t| t.league_record(self)[:losses] }.sort_by { |k, _v| k }
      teams_by_loss.each do |loss, loss_team_array|
        # Now sort within win/loss group by ELO descending
        teams_by_elo = loss_team_array.sort_by(&:elo_cache).reverse

        teams_by_elo.each do |t|
          output.push(
            team: t,
            wins: win,
            losses: loss
          )
        end
      end
    end

    output
  end

  def freeze!
    self.final_standings = nil
    save
    self.final_standings = JSON.pretty_generate(Division.frozen_team_to_id(sorted_teams))
    save
  end

  def la_name
    output = season.name
    output += ' ' + (day_of_week == 1 ? 'Monday' : 'Tuesday')
    output += ' (' + Time.parse(time).strftime('%-l:%M%P') + ')'
    output += ' ' + name.split.last + ' Division'
    output
  end

  def la_csv
    require 'csv'

    attributes = %w[
      SUB_PROGRAM
      HOME_TEAM
      AWAY_TEAM
      DATE
      START_TIME
      END_TIME
      LOCATION
      SUB_LOCATION
      TYPE
      NOTES
    ]

    CSV.generate(headers: true) do |csv|
      csv << attributes

      matches.order(:time, :location).each do |m|
        row = []
        row << nil
        row << m.home_team.name
        row << m.away_team.name
        row << m.time.in_time_zone('America/Chicago').strftime('%-m/%-d/%Y')
        row << m.time.in_time_zone('America/Chicago').strftime('%H:%M')
        row << (m.time + 1.hour).in_time_zone('America/Chicago').strftime('%H:%M')
        row << 'the royal palms shuffleboard club'
        row << "Court #{m.location.split.last.to_i}"
        row << 'REGULAR_SEASON'
        row << nil
        csv << row
      end
    end
  end

  def self.frozen_id_to_team(input)
    output = []

    input.each do |t|
      output.push(
        team: Team.find(t['team_id']),
        wins: t['wins'],
        losses: t['losses']
      )
    end

    output
  end

  def self.frozen_team_to_id(input)
    output = []

    input.each do |t|
      output.push(
        team_id: t[:team].id,
        wins: t[:wins],
        losses: t[:losses]
      )
    end

    output
  end
end
