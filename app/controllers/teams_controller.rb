class TeamsController < ApplicationController
  def index
    @teams = if params[:all_teams]
               Team.all.order('elo_cache DESC').map { |t| { team: t } }
             else
               Season.last.teams.order('elo_cache DESC').map { |t| { team: t } }
             end
  end

  def show
    @team = Team.find(params[:id])
    @matches = @team.matches.order('time DESC')
  end
end
