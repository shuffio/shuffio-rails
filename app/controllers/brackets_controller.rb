class BracketsController < ApplicationController
  def index
    @brackets = Bracket.all
  end

  def show
    @bracket = Bracket.find(params[:id])
  end
end
