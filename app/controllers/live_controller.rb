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

  def si
    game = params[:id] ? Game.find(params[:id]) : LiveEvent.last.left_game

    @game_id = game.id

    @frame_text = game.complete? ? 'Final' : "Frame #{game.next_frame}"

    @yellow_wins = game.series_score[0]
    @black_wins = game.series_score[1]

    @yellow_hammer = !game.complete? && game.next_hammer == 'yellow'
    @black_hammer = !game.complete? && game.next_hammer == 'black'

    @yellow_name = params[:short_name] ? game.yellow_team.display_name : game.yellow_team.name
    @black_name = params[:short_name] ? game.black_team.display_name : game.black_team.name

    @yellow_score = game.frames.last[0]
    @black_score = game.frames.last[1]

    render layout: 'live-absolute'
  end
end
