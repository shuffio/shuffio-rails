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
    output += "#{season.name} - #{name}\n"
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
    output = []

    # Group and Sort teams by # of wins descending
    # teams_by_win = {2: [], 1: [], 0: []}
    teams_by_win = teams.group_by { |t| t.league_record(self)[:wins] }.sort_by { |k, _v| k }.reverse
    teams_by_win.each do |_win, win_team_array|
      # Now group and sort the "win" group by # of losses
      teams_by_loss = win_team_array.group_by { |t| t.league_record(self)[:losses] }.sort_by { |k, _v| k }
      teams_by_loss.each do |_loss, loss_team_array|
        # Now sort within win/loss group by ELO descending
        teams_by_elo = loss_team_array.sort_by(&:elo_cache).reverse

        teams_by_elo.each do |t|
          output.push(t)
        end
      end
    end

    output
  end
end
