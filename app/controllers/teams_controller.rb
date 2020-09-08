class TeamsController < ApplicationController
  def index
    @teams = if params[:all_teams]
               Team.all.order('elo_cache DESC').map { |t| { team: t } }
             else
               Season.last.teams.order('elo_cache DESC').map { |t| { team: t } }
             end

     respond_to do |format|
       format.html
       format.csv { send_data Team.export_csv, filename: "teams_#{DateTime.now.strftime('%Y-%m-%d_%H-%M-%S')}.csv" }
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
