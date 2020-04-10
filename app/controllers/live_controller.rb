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

  def new_overlay
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
end
