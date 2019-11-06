class Admin::MatchesController < Admin::BaseController
  def index
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)

    if @match.save
      redirect_to admin_matches_path
    else
      render 'new'
    end
  end

  def edit
    @match = Match.find(params[:id])
  end

  def update
    @match = Match.find(params[:id])

    if @match.update(team_params)
      redirect_to admin_matches_path
    else
      render 'edit'
    end
  end

  def match_params
    params.require(:team).permit(
      # :name,
      # :short_name,
      # :captain
    )
  end
end
