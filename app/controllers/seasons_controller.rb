class SeasonsController < ApplicationController
  def index
    @seasons = Season.all
  end

  def show
    @season = Season.find(params[:id])
    @show_elo = @season.latest?
    @show_elo_change = @season.latest? && @season.started?

    @monday_divisions = @season.divisions.where(day_of_week: 1)
    @tuesday_divisions = @season.divisions.where(day_of_week: 2)
  end

  def show_current
    @season = Season.order(:start_date).last
    @show_elo = true
    @show_elo_change = @season.latest? && @season.started?

    @monday_divisions = @season.divisions.where(day_of_week: 1)
    @tuesday_divisions = @season.divisions.where(day_of_week: 2)

    render template: 'seasons/show'
  end

  def report
    @season = Season.find(params[:id])
  end
end
