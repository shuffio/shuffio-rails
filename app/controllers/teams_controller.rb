class TeamsController < ApplicationController
  def index
    @teams = if params[:current_season]
               Season.last.teams.order('elo_cache DESC').map { |t| { team: t } }
             else
               Team.all.order('elo_cache DESC').map { |t| { team: t } }
             end
  end
end
