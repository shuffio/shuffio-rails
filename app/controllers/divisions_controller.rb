class DivisionsController < ApplicationController
  def index
    @divisions = Division.all.order('season_id DESC', :day_of_week, :time)
  end

  def show
    @division = Division.find(params[:id])
    @teams = @division.sorted_teams
  end
end
