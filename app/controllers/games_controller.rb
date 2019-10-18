class GamesController < ApplicationController
  # TODO: token based for JSON, regular auth/csrf for web; or move this whole thing to /api/ namespace
  skip_before_action :verify_authenticity_token
  before_action :authorized?

  def update
    # TODO: return errors array as well
    # errors = []
    warnings = []

    game = Game.find(params[:id])

    yellow_team = Team.find_by(name: params[:yellow_team])
    if yellow_team
      game.update(yellow_team: yellow_team) unless game.yellow_team == yellow_team
    elsif params[:yellow_team].present?
      warnings << "Could not find Yellow Team named '#{params[:yellow_team]}'"
    end

    black_team = Team.find_by(name: params[:black_team])
    if black_team
      game.update(black_team: black_team) unless game.black_team == black_team
    elsif params[:black_team].present?
      warnings << "Could not find Black Team named '#{params[:black_team]}'"
    end

    # reject here removes blank frames, which at least half will be from spreadsheet
    game.update(frames: params[:frames].reject { |f| f == ['', ''] })
  end

  private

  def authorized?
    return true if request.headers['live-secret'] == ENV['LIVE_SECRET']

    render json: { error: 'You are not authorized. Be sure to pass in the live-secret as a header.' }, status: :unauthorized
  end
end
