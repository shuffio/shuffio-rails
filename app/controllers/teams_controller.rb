class TeamsController < ApplicationController
  def index
    @teams = Team.all.order('elo_cache DESC')
  end
end
