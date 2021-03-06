class Admin::CanamController < Admin::BaseController
  # These aren't the best from a REST or reusability standpoint, but we'll fix it up when we have more tournament types
  def index
    @tournament = Tournament.find_by(name: 'Mirror Lake 2021')
  end

  def player
    @tournament = Tournament.find_by(name: 'Mirror Lake 2021')
  end

  def summary
    @tournament = Tournament.find_by(name: 'Mirror Lake 2021')
  end

  def import
    tr = TournamentRound.find(params['tournament_round_id'])
    redirect_to :admin_canam_index, alert: 'This Round already has matches' and return if tr.matches.any?
    redirect_to :admin_canam_index, alert: 'Only Round 1 can be imported' and return unless tr.number == 1

    # need to strip excel's characters on the way in if they exist
    clean_csv = params[:file].read.sub("\xEF\xBB\xBF".force_encoding('ASCII-8BIT'), '')
    tr.generate_matches(csv_data: clean_csv)
    redirect_to :admin_canam_index, notice: 'Imported Matches'
  end

  def tournament_round_matches
    tr = TournamentRound.find(params['canam_id'])
    tr.matches.destroy_all

    redirect_to :admin_canam_index, alert: 'Deleted Matches'
  end

  def generate_tournament_round_matches
    tr = TournamentRound.find(params['canam_id'])
    tr.generate_matches

    redirect_to :admin_canam_index, notice: 'Generated Matches'
  end

  def assign_courts
    @tr = TournamentRound.find(params['canam_id'])
    other_rounds = @tr.tournament.tournament_rounds.where('number = ? AND tournament_rounds.id != ?', @tr.number, @tr.id)
    other_courts = other_rounds.map(&:courts).flatten

    @location_courts = @tr.tournament.location.courts.order(:name).map do |c|
      {
        id: c.id,
        name: c.name,
        used: @tr.courts.include?(c),
        other_group: other_courts.include?(c)
      }
    end
  end

  def process_courts
    court_params = params.select { |p| p.starts_with?('court_id_') }
    courts = court_params.to_unsafe_h.map { |k, _v| Court.find(k.split(/_/).last) }

    tr = TournamentRound.find(params['canam_id'])
    tr.courts.clear
    tr.courts << courts

    redirect_to :admin_canam_index, notice: 'Courts Assigned'
  end
end
