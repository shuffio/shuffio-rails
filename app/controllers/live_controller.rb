class LiveController < ApplicationController
  def index
    @left_game = Game.find(1)
    @right_game = Game.find(2)

    default_team = OpenStruct.new(color: '#ffff00', display_name: 'The Defaults!')

    @team1 = @left_game.yellow_team || default_team
    @team2 = @left_game.black_team || default_team
    @team3 = @right_game.yellow_team || default_team
    @team4 = @right_game.black_team || default_team
    render layout: 'live'
  end
end
