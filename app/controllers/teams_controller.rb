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
    @show_toggle = @team.matches.where('time > ?', DateTime.now).any?

    @matches = if params[:all_matches]
                 @team.matches.order('time DESC')
               else
                 @team.matches.where('time < ?', DateTime.now).order('time DESC')
               end
  end
end
