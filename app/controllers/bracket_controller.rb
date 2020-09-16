class BracketController < ApplicationController
  def index
  end

  def new
    @tournament = Tournament.last
  end

  def current
    @tournament = Tournament.last
    @placeholder_team_ids = (685..700).to_a
    @chicago_final_match = Tournament.last.tournament_groups[0].tournament_rounds.last.matches[0]
    @brooklyn_final_match = Tournament.last.tournament_groups[1].tournament_rounds.last.matches[0]
    @chi_bkl_final_match = Tournament.last.tournament_groups[2].tournament_rounds.last.matches[0]
  end
end
