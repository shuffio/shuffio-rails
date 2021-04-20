class SeasonsController < ApplicationController
  def index
    @seasons = Season.all.order(start_date: :desc)
  end

  def show
    @season = Season.find(params[:id])
    @show_elo = @season.latest?
    @show_elo_change = @season.latest? && @season.started?

    @monday_divisions = @season.divisions.where(day_of_week: 1).order(:time)
    @tuesday_divisions = @season.divisions.where(day_of_week: 2).order(:time)
    @wednesday_divisions = @season.divisions.where(day_of_week: 3).order(:time)
  end

  def show_current
    @season = Season.order(:start_date).last
    @show_elo = true
    @show_elo_change = @season.latest? && @season.started?

    @monday_divisions = @season.divisions.where(day_of_week: 1).order(:time)
    @tuesday_divisions = @season.divisions.where(day_of_week: 2).order(:time)
    @wednesday_divisions = @season.divisions.where(day_of_week: 3).order(:time)

    render template: 'seasons/show'
  end

  def report
    @season = Season.find(params[:id])
  end
end
