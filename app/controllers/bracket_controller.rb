class BracketController < ApplicationController
  def index
  end

  def new
    @tournament = Tournament.last
  end

  def current
    @tournament = Tournament.last
  end
end
