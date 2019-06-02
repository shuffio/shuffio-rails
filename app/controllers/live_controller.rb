class LiveController < ApplicationController
  def index
    # TODO: add a view for show(id), but for now only expect one LiveEvent
    @live_event = LiveEvent.last
    @left_game = @live_event.left_game
    @right_game = @live_event.right_game

    default_team = OpenStruct.new(color: '#ffff00', display_name: 'The Defaults!')

    @team1 = @left_game.yellow_team || default_team
    @team2 = @left_game.black_team || default_team
    @team3 = @right_game.yellow_team || default_team
    @team4 = @right_game.black_team || default_team

    render layout: 'live'
  end
end
