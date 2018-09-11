class MatchController < ApplicationController
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
