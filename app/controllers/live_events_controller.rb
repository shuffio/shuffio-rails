class LiveEventsController < ApplicationController
  # TODO: token based for JSON, regular auth/csrf for web; or move this whole thing to /api/ namespace
  skip_before_action :verify_authenticity_token
  before_action :authorized?

  def update
    # TODO: return errors array as well
    # errors = []
    warnings = []

    # TODO: Find or create
    @live_event = LiveEvent.find(params[:id])

    left_game = Game.find_by(match_id: params[:left_match_id], number: params[:left_game_number])
    if left_game
      @live_event.update(left_game: left_game) unless @live_event.left_game == left_game

      left_location = "Court #{format('%02d', params[:left_court_number])}"
      left_game.match.update(location: left_location) unless left_game.match.location == left_location

      left_game.match.update(comment: params[:left_description]) unless left_game.match.comment == params[:left_description]
    elsif params[:left_match_id].present?
      warnings << "Could not find Left Game for Match '#{params[:left_match_id]}'"
    end

    right_game = Game.find_by(match_id: params[:right_match_id], number: params[:right_game_number])

    right_location = "Court #{format('%02d', params[:right_court_number])}"
    right_game.match.update(location: right_location) unless right_game.match.location == right_location

    right_game.match.update(comment: params[:right_description]) unless right_game.match.comment == params[:right_description]

    if right_game
      @live_event.update(right_game: right_game) unless @live_event.right_game == right_game
    elsif params[:right_game_match_id].present?
      warnings << "Could not find Right Game for Match '#{params[:right_game_match_id]}'"
    end

    # TODO: Show Bracket Boolean
    # TODO: Court and Description updates
  end

  private

  def authorized?
    return true if request.headers['live-secret'] == ENV['LIVE_SECRET']

    render json: { error: 'You are not authorized. Be sure to pass in the live-secret as a header.' }, status: :unauthorized
  end
end
