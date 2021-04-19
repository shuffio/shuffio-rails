class Admin::MatchesController < Admin::BaseController
  def index
    # TODO: real order and paginate
    @matches = Match.last(100).reverse
  end

  def show
    @match = Match.find(params[:id])
  end
end
