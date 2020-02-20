class TournamentRoundsController < ApplicationController
  def index
  end

  def show
    @tournament_round = TournamentRound.find(params[:id])
    @tr = @tournament_round
  end
end
