class TeamsController < ApplicationController
  def index
    @teams = if params[:current_season]
               Season.last.teams.order('elo_cache DESC')
             else
               Team.all.order('elo_cache DESC')
             end
  end
end
