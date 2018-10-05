class DivisionsController < ApplicationController
  def index
    @divisions = Division.all
  end

  def show
    @division = Division.find(params[:id])
    @teams = @division.sorted_teams
  end

  def current_season
    @monday = Season.last.divisions.where(day_of_week: 1)
    @tuesday = Season.last.divisions.where(day_of_week: 1)
  end
end
