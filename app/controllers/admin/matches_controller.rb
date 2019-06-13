class Admin::MatchesController < Admin::BaseController
  def index
    @matches = Match.all.order(time: :desc).paginate(page: params[:page], per_page: 50)
  end
end
