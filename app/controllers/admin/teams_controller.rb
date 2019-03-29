class Admin::TeamsController < Admin::BaseController
  def index
    @teams = if params[:all_teams]
               Team.all.order(:name)
             else
               Season.last.teams.order(:name)
             end
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to team_path(@team)
    else
      render 'new'
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])

    if @team.update(team_params)
      # TODO: if name updated, update former_names
      redirect_to team_path(@team)
    else
      render 'edit'
    end
  end

  def team_params
    params.require(:team).permit(
      :name,
      :short_name,
      :captain
    )
  end
end
