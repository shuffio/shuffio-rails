class MatchesController < ApplicationController
  def show
    @match = Match.find(params[:id])

    # TODO: non-json view as well
    render json: @match, include: [:games]
  end

  def ae_data
    @match = Match.find(params[:id])
    render json: @match.ae_data
  end

  def new
    @match = Match.new
    @tames = Team.all.order('name')
  end

  def create
    @match = Match.new(match_params)

    if @match.save
      redirect_to matches_path
    else
      render 'new'
    end
  end

  def index
    @matches = Match.all.order('time DESC')
  end
end
