class DivisionsController < ApplicationController
  def index
    @divisions = Division.all
  end

  def show
    @division = Division.find(params[:id])
    @teams = @division.sorted_teams
  end

  def current_season
    @divisions = Season.last.divisions
  end
end
