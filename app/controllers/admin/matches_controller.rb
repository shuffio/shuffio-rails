class Admin::MatchesController < Admin::BaseController
  def index
    # TODO: real order and paginate
    @matches = Match.last(100).reverse
  end

  def show
    @match = Match.find(params[:id])
  end

  def new
    @match = Match.new
    @court_select = Location.find_by(name: 'Royal Palms Chicago').courts.order(:name).collect { |c| [c.name, c.id] }
    @division_select = Division.all.order('season_id DESC', :day_of_week, :time).collect { |d| [d.la_name, d.id] }
    @team_select = Team.all.order('name').collect { |t| ["#{t.name} (#{t.id})", t.id] }
  end

  def create
    @match = Match.new(match_params)

    if @match.save
      redirect_to admin_match_path(@match)
    else
      render 'new'
    end
  end

  def edit
    @match = Match.find(params[:id])
    @court_select = Location.find_by(name: 'Royal Palms Chicago').courts.order(:name).collect { |c| [c.name, c.id] }
    @division_select = Division.all.order('season_id DESC', :day_of_week, :time).collect { |d| [d.la_name, d.id] }
    @team_select = Team.all.order('name').collect { |t| ["#{t.name} (#{t.id})", t.id] }
  end

  def update
    @match = Match.find(params[:id])

    if @match.update(match_params)
      redirect_to admin_match_path(@match)
    else
      render 'edit'
    end
  end

  def destroy
    @match = Match.find(params[:id])

    @match.destroy

    redirect_to admin_matches_path
  end

  def match_params
    params.require(:match).permit(
      :time,
      :court_id,
      :division_id,
      :away_team_id,
      :home_team_id,
      :away_score,
      :home_score,
      :multiplier,
      :comment
    )
  end
end
