class LiveController < ApplicationController
  def index
    @left_game = Game.find(1)
    @right_game = Game.find(2)

    @team1 = @left_game.yellow_team
    @team2 = @left_game.black_team
    @team3 = @right_game.yellow_team
    @team4 = @right_game.black_team
    render layout: 'live'
  end
end
