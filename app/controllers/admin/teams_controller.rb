class Admin::TeamsController < Admin::BaseController
  def index
    @teams = if params[:all_teams]
               Team.all.order(:name)
             else
               Season.last.teams.order(:name)
             end
  end
end
