class SeasonsController < ApplicationController
  def index
    @seasons = Season.all
  end

  def show
    @season = Season.find(params[:id])

    @monday_divisions = @season.divisions.where(day_of_week: 1)
    @tuesday_divisions = @season.divisions.where(day_of_week: 2)
  end

  def show_current
    @season = Season.last

    @monday_divisions = @season.divisions.where(day_of_week: 1)
    @tuesday_divisions = @season.divisions.where(day_of_week: 2)

    render template: 'seasons/show'
  end
end
