class Schedule < ApplicationRecord
  def self.match_time_for_week(week)
    day = Date.today

    (week - 1).times do
      day += 1.week
    end

    Time.find_zone('America/Chicago').parse("#{day} 18:30:00")
  end

  def self.setup_teams
    20.times do |n|
      Team.create(name: "Rank #{format('%02d', n + 1)}", captain: 'nobody', starting_elo: 1190 - (n * 20))
    end
  end

  # Returns array of Matches, but doesn't save them
  def self.setup_matches
    output_matches = []

    # Sort teams into away and home via snake order
    s_teams = Team.last(20)

    away_teams = [
      s_teams[0],
      s_teams[3],
      s_teams[4],
      s_teams[7],
      s_teams[8],
      s_teams[11],
      s_teams[12],
      s_teams[15],
      s_teams[16],
      s_teams[19]
    ]
    home_teams = [
      s_teams[1],
      s_teams[2],
      s_teams[5],
      s_teams[6],
      s_teams[9],
      s_teams[10],
      s_teams[13],
      s_teams[14],
      s_teams[17],
      s_teams[18]
    ]

    court_count = 10

    # Randomize teams
    # TODO: programatic shuffle
    away_teams.shuffle!
    home_teams.shuffle!

    initial_away_teams = away_teams
    initial_home_teams = home_teams

    opponents_hash = {}

    s_teams.each do |t|
      opponents_hash[t.id] = []
    end

    # Set up 8 weeks
    8.times do |w|
      # Set up week 1
      court_count.times do |i|
        m = Match.new(
          time: match_time_for_week(w + 1),
          division: nil,
          location: "Court #{format('%02d', i + 1)}",
          away_team: away_teams[i],
          home_team: home_teams[i],
          away_score: 0,
          home_score: 0
        )

        opponents_hash[away_teams[i].id].push(home_teams[i])
        opponents_hash[home_teams[i].id].push(away_teams[i])
        output_matches.push(m)
      end

      # Away teams increase court # (1,2,3,4,etc)
      away_teams.rotate!(-1)
      # Home teams decreate court # (2,1,10,9,etc)
      home_teams.rotate!(1)
      # In week 5, home moves twice
      home_teams.rotate!(1) if w == 3
    end

    {
      matches: output_matches,
      initial_away_teams: initial_away_teams,
      initial_home_teams: initial_home_teams,
      opponents_hash: opponents_hash
    }
  end

  def self.match_stats(opponents_hash)
    min_opponent_elo_total = nil
    max_opponent_elo_total = nil

    opponents_hash.each do |_team_id, opponents|
      elo_total = 0

      opponents.each do |t|
        elo_total += t.elo_cache
      end

      min_opponent_elo_total = elo_total if min_opponent_elo_total.nil? || elo_total < min_opponent_elo_total
      max_opponent_elo_total = elo_total if max_opponent_elo_total.nil? || elo_total > max_opponent_elo_total
    end

    {
      min_opponent_elo_total: min_opponent_elo_total,
      max_opponent_elo_total: max_opponent_elo_total,
      diff: max_opponent_elo_total - min_opponent_elo_total
    }
  end

  def self.stats_string(stats)
    "min:#{stats[:min_opponent_elo_total]} max:#{stats[:max_opponent_elo_total]} diff:#{stats[:diff]}"
  end

  def self.run_simulation(num_times = 1)
    best_case = {}
    best_diff = nil

    num_times.times do |i|
      schedule = Schedule.setup_matches
      stats = match_stats(schedule[:opponents_hash])

      if best_diff.nil? || stats[:diff] < best_diff
        best_case = schedule
        best_diff = stats[:diff]
      end

      next unless ((i + 1) % 100).zero?

      Rails.logger.info "Completed #{i + 1} iterations. Best so far:\n#{Schedule.stats_string(Schedule.match_stats(best_case[:opponents_hash]))}\n"
    end

    best_case
  end
end
