class LiveController < ApplicationController
  def index
    render layout: 'application'
  end

  def lower_third
    # This may need to be updated day-of once we see the camera views
    @games = [
      LiveEvent.all.last(2).first.right_game, # Dieter/Evan
      LiveEvent.all.last(2).last.right_game, # Sach /Eil
      LiveEvent.all.last(2).last.left_game, # Fab / Deb
      LiveEvent.all.last(2).first.left_game # Mats/Torben
    ]

    render layout: 'lower_third'
  end

  def lower_third_doubles
    # This may need to be updated day-of once we see the camera views
    @games = [
      LiveEvent.last.left_game,
      LiveEvent.last.right_game
    ]

    render layout: 'lower_third_doubles'
  end

  def summary
    # This may need to be updated day-of once we see the camera views
    @games = [
      LiveEvent.all.last(2).first.right_game, # Dieter/Evan
      LiveEvent.all.last(2).last.right_game, # Sach /Eil
      LiveEvent.all.last(2).last.left_game, # Fab / Deb
      LiveEvent.all.last(2).first.left_game # Mats/Torben
    ]
    render layout: 'summary'
  end

  def summary_doubles
    # This may need to be updated day-of once we see the camera views
    @games = [
      LiveEvent.last.left_game,
      LiveEvent.last.right_game
    ]
    render layout: 'summary_doubles'
  end

  def four_game
    # This may need to be updated day-of once we see the camera views
    @games = [
      LiveEvent.all.last(2).first.right_game, # Dieter/Evan
      LiveEvent.all.last(2).last.right_game, # Sach /Eil
      LiveEvent.all.last(2).last.left_game, # Fab / Deb
      LiveEvent.all.last(2).first.left_game # Mats/Torben
    ]
    render layout: 'live'
  end

  def two_game
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
