class TournamentRound < ApplicationRecord
  belongs_to :tournament_group
  has_many :matches, -> { order(:tournament_order) }
  has_and_belongs_to_many :courts
  delegate :tournament, to: :tournament_group

  def teams
    matches.map(&:away_team) + matches.map(&:home_team)
  end

  # courts will return what courts were specified; courts_used will look for matches
  def courts_used
    matches.map(&:court).uniq
  end

  def completed_matches
    matches.where.not(away_score: 0, home_score: 0)
  end

  def generate_matches(additional_data = {})
    # TODO: find real railsy errors to throw
    throw "#{matches.count} #{'match'.pluralize} already created. You must destroy these first." if matches.any?
    throw 'TournamentRound format not yet implemented' unless format == 'group' && tournament_group.tournament.format == 'canam'

    if number == 1
      throw 'CSV data missing' unless additional_data[:csv_data]
      generate_matches_canam_round_one(additional_data[:csv_data])
    else
      generate_matches_canam_later_groups
    end
  end

  def bracket_meta
    {
      id: id,
      number: number,
      name: name,
      format: format,
      match_count: matches.count,
      matches: matches.map(&:bracket_meta)
    }
  end

  private

  def generate_matches_canam_round_one(csv_data)
    # TODO: All kinds of error checking:
    # - every match exactly have two players?
    # - duplicate names?
    # - courts all exist?

    require 'csv'

    stpete = tournament.location
    tbd = Team.find_or_create_by(name: 'TBD')

    # Parse CSV data
    players = CSV.new(csv_data, headers: true, header_converters: :symbol)

    self.rotation = 0
    save

    # TODO: Check for duplicate names
    players.each do |p|
      # Skip any rows without the full information
      next unless p[:name] && p[:court] && p[:side] && p[:color]

      # Create court if needed, also added to the tournament_rounds to courts relation
      court = Court.find_or_create_by(location: stpete, name: p[:court])
      courts << court unless courts.include?(court)

      player = Team.find_or_create_by(name: p[:name])
      match = Match.find_by(court: court, location: p[:side], tournament_round: self)

      if match
        if p[:color] == 'Yellow'
          match.update(away_team: player)
        elsif p[:color] == 'Black'
          match.update(home_team: player)
        end
      else
        if p[:color] == 'Yellow'
          Match.create(
            away_team: player,
            home_team: tbd,
            away_score: 0,
            home_score: 0,
            court: court,
            location: p[:side],
            time: round_start_time,
            tournament_round: self
          )
        elsif p[:color] == 'Black'
          Match.create(
            away_team: tbd,
            home_team: player,
            away_score: 0,
            home_score: 0,
            court: court,
            location: p[:side],
            time: round_start_time,
            tournament_round: self
          )
        end
      end
    end
  end

  def generate_matches_canam_later_groups
    # TODO: throw error if not enough courts
    # TODO: throw error if surpluss of courts, so we don't have more than 1 with head only
    round_one = TournamentRound.find_by(tournament_group: tournament_group, number: 1)
    throw 'Round One not yet created' unless round_one

    matches = [] # define here for scope
    retry_matches = false
    # TODO: how large can we make this without heroku killing the process
    max_iterations = 200 # if this is exceeded, we allow duplicate courts

    loop.with_index do |_, loop_iterations|
      courts_avail = courts.to_a.map { |c| [{ court: c, side: 'Head' }, { court: c, side: 'Foot' }] }.flatten
      yellow_starters = round_one.matches.order(:id).map(&:away_team)
      black_starters = round_one.matches.order(:id).map(&:home_team)
      matches = [] # reset in loop
      retry_matches = false

      # Rotate the black_starters by a random number not divisible by its size
      potential_rotations = (1..(yellow_starters.size - 1)).reject { |r| r == tournament_group.tournament_rounds.map(&:rotation) }
      throw "Couldn't find a rotation value not already used. You need more players or try again." if potential_rotations.size.zero?

      self.rotation = potential_rotations.sample
      save

      if number.even?
        yellow_players = black_starters.dup.rotate(rotation)
        black_players = yellow_starters.dup
      else
        yellow_players = yellow_starters.dup
        black_players = black_starters.dup.rotate(rotation)
      end

      yellow_players.each_with_index do |yellow, i|
        black = black_players[i]
        next unless yellow && black

        other_courts = tournament.matches.where('away_team_id = ? OR away_team_id = ? OR home_team_id = ? OR home_team_id = ?',
                                                yellow.id, black.id, yellow.id, black.id).map(&:court)

        potential_courts = courts_avail
        potential_courts = courts_avail.reject { |c| other_courts.include?(c[:court]) } if loop_iterations < max_iterations

        if potential_courts.empty?
          retry_matches = true
          break
        end

        court = potential_courts.sample
        courts_avail.delete(court)

        matches.push(Match.new(
                       away_team: yellow,
                       home_team: black,
                       away_score: 0,
                       home_score: 0,
                       court: court[:court],
                       location: court[:side],
                       time: round_start_time,
                       tournament_round: self
                     ))
      end
      break unless retry_matches

      throw 'Loop never completed' if loop_iterations > max_iterations * 2
    end

    matches.each(&:save)
  end

  def round_start_time
    tournament.start_time + (90 * (number - 1)).minutes
  end
end
