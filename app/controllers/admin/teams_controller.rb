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

  def import
    @teams = Team.find_from_la_csv(params[:file].read)
  end

  def import_selection
    d = Division.find(params[:division][:division_id])

    new_teams = 0
    existing_teams = 0

    # Filter Params for team selection
    params.select { |k, _v| k.to_s.match(/^\!team/) }.each do |_id, team_action|
      next if team_action == 'nothing'

      action = JSON.parse(team_action)

      if action['action'] == 'new'
        new_teams += 1
        t = Team.create(name: action['name'], captain: action['captain'])
        t.divisions << d
      elsif action['action'] == 'existing'
        existing_teams += 1
        t = Team.find(action['id'])
        t.divisions << d
      end
    end

    redirect_to :admin_teams, notice: "Imported #{new_teams + existing_teams} teams, #{new_teams} new, #{existing_teams} existing"
  end

  def team_params
    params.require(:team).permit(
      :name,
      :short_name,
      :captain
    )
  end
end
