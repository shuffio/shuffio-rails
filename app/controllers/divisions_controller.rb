class DivisionsController < ApplicationController
  def index
    @divisions = Division.all.order('season_id DESC', :day_of_week, :time)
  end

  def show
    @division = Division.find(params[:id])

    @teams = @division.sorted_teams
    @show_elo = @division.season.latest?
    @show_elo_change = @division.season.latest? && @division.season.started?

    respond_to do |format|
      format.html
      format.csv { send_data @division.la_csv, filename: "league-schedule-#{@division.name.parameterize}.csv" }
    end
  end

  def show_playoff
    @division = Division.find(params[:id])

    if @division.final_standings
      flash[:alert] = 'Rankings are final, no prediction needed'
      redirect_to division_path(params[:id]) and return
    end

    @teams = @division.playoff_prediction
    @show_elo = true
    @show_elo_change = false

    respond_to do |format|
      format.html { render template: 'divisions/show' }
    end
  end

  def week
    admin? if params[:report]

    @division = Division.find(params[:id])

    @week = params[:week].to_i
    raise ActionController::RoutingError, 'Only Weeks 1-8 are valid' unless Array(1..8).include?(@week)

    @matches = @division.matches_for_week(@week)
    @time = @division.match_time_for_week(@week)

    respond_to do |format|
      format.html
      format.csv { send_data @division.matchup_csv(@week), filename: "matchup-#{@division.name.parameterize}-week#{@week}.csv" }
    end
  end

  def week_report
    admin?

    division = Division.find(params[:id])
    week = params[:week].to_i

    params.each do |param, value|
      next unless param.starts_with?('Court ')

      # TODO: fix this to work for multiple locations
      l = Location.find_by(name: 'Royal Palms Chicago')
      c = Court.find_by(name: param, location: l)
      m = Match.find_by(court: c, division: division, time: division.match_time_for_week(week))

      m.update(home_score: 1, away_score: 0) if value == 'home'
      m.update(home_score: 0, away_score: 1) if value == 'away'

      m.calculate_elo
    end

    flash[:success] = 'Results Saved!'

    redirect_to(division_week_path(division.next_division, week, report: true)) and return if division.next_division

    redirect_to root_path
  end

  def admin?
    return if current_user && current_user.is_admin?

    flash[:error] = 'You are not authorized to view that page'
    redirect_to root_path
  end
end
