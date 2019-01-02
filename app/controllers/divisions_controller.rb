class DivisionsController < ApplicationController
  def index
    @divisions = Division.all.order('season_id DESC', :day_of_week, :time)
  end

  def show
    @division = Division.find(params[:id])
    @teams = @division.sorted_teams
    @show_elo = @division.season.latest?
    @show_elo_change = @division.season.latest? && @division.season.started?
  end

  def week
    @division = Division.find(params[:id])

    @week = params[:week].to_i
    raise ActionController::RoutingError, 'Only Weeks 1-8 are valid' unless Array(1..8).include?(@week)

    @matches = @division.matches_for_week(@week)
    @time = @division.match_time_for_week(@week)
  end
end
