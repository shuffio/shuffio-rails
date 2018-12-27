class TeamsController < ApplicationController
  def index
    @teams = if params[:current_season]
               Season.last.teams.order('elo_cache DESC').map { |t| { team: t } }
             else
               Team.all.order('elo_cache DESC').map { |t| { team: t } }
             end
  end

  def show
    @team = Team.find(params[:id])
    @matches = @team.matches.order('time DESC')
  end
end
