class LiveController < ApplicationController
  def index
    render layout: 'application'
  end

  # TODO: all of these views should take an id, but for now only expect one LiveEvent
  def lower_third
    @games = [
      LiveEvent.last.left_game,
      LiveEvent.last.right_game
    ]
    render layout: 'live'
  end

  def four_frame_summary
    @games = [
      LiveEvent.last.left_game
    ]

    render layout: 'live'
  end

  def summary
    @games = [
      LiveEvent.last.left_game,
      LiveEvent.last.right_game
    ]
    render layout: 'live'
  end

  def four_game
    @games = [
      LiveEvent.last.left_game,
      LiveEvent.last.right_game,
      LiveEvent.last.left_game,
      LiveEvent.last.right_game
    ]
    render layout: 'live'
  end

  def two_game
    @games = [
      LiveEvent.last.left_game,
      LiveEvent.last.right_game
    ]
    render layout: 'live'
  end

  def full_game
    @min_frames = LiveEvent.last.left_game.max_frames || 8
    @games = [
      LiveEvent.last.left_game
    ]

    render layout: 'live'
  end

  # Helper function to determine if params are set to strings we'd consider false
  def param_present?(param)
    return false if param.blank?
    return false if param == 'false'
    return false if param == 'False'

    true
  end

  def si
    game = params[:id] ? Game.find(params[:id]) : LiveEvent.last.left_game

    @game_id = game.id
    @side_switch = param_present?(params[:side_switch])
    @left_color = @side_switch ? 'black' : 'yellow'
    @right_color = @side_switch ? 'yellow' : 'black'

    @frame_text = game.complete? ? 'Final' : "Frame #{game.next_frame}"

    @left_wins = @side_switch ? game.series_score[1] : game.series_score[0]
    @right_wins = @side_switch ? game.series_score[0] : game.series_score[1]

    @yellow_hammer = !game.complete? && game.next_hammer == 'yellow'
    @black_hammer = !game.complete? && game.next_hammer == 'black'

    yellow_name = params[:short_name] ? game.yellow_team.display_name : game.yellow_team.name
    black_name = params[:short_name] ? game.black_team.display_name : game.black_team.name
    @left_name = @side_switch ? black_name : yellow_name
    @right_name = @side_switch ? yellow_name : black_name

    @left_score = @side_switch ? game.frames.last[1] : game.frames.last[0]
    @right_score = @side_switch ? game.frames.last[0] : game.frames.last[1]

    render layout: 'live-absolute'
  end
end
