class BracketController < ApplicationController
  before_action :authenticate_user!, except: [:index, :current, :show]
  def index
  end

  def new
    @bracket = Bracket.new
    @tournament = Tournament.last
  end

  def create
    @tournament = Tournament.last
    @bracket = Bracket.new(
      user: current_user,
      tournament_group: TournamentGroup.find(params[:bracket][:tournament_group_id]),
      match_data: {}
    )

    if @bracket.save
      redirect_to edit_bracket_path(@bracket)
    else
      render 'new'
    end
  end

  def edit
    @bracket = Bracket.find(params[:id])
    unless current_user == @bracket.user
      flash[:error] = 'You cannot update this bracket' 
      redirect_to bracket_index_path and return
    end

    @current_round = @bracket.next_round
  end

  def show
    @bracket = Bracket.find(params[:id])
    @placeholder_team_ids = ((685..700).to_a + Team.where(name: 'TBD').pluck(:id))
    @final_match = @bracket.tournament_group.tournament_rounds.last.matches[0]
  end

  def update
    @bracket = Bracket.find(params[:id])
    unless current_user == @bracket.user
      flash[:error] = 'You cannot update this bracket' 
      redirect_to bracket_index_path and return
    end

    @current_round = @bracket.next_round

    match_selections = @bracket.match_data

    # TODO: ensure all were filled out

    params.each do |p_name, p_value|
      next unless p_name.starts_with?('match_')

      match_id = p_name.split('_').last
      match_selections[match_id] = p_value.to_i
    end

    if @bracket.update(match_data: match_selections)
      flash[:alert] = 'You must select a winner for all matches' if @current_round == @bracket.next_round
      redirect_to edit_bracket_path(@bracket) and return if @bracket.next_round

      flash[:notice] = 'You have successfully set your bracket. Great Luck!'
      redirect_to current_bracket_path
    else
      render 'edit'
    end
  end

  def destroy  
    @bracket = Bracket.find(params[:id])

    unless current_user == @bracket.user
      flash[:error] = 'You cannot update this bracket' 
      redirect_to bracket_path(@bracket) and return
    end

    @bracket.update(match_data: {})
    redirect_to edit_bracket_path(@bracket)
  end

  def current
    @tournament = Tournament.last
    @placeholder_team_ids = ((685..700).to_a + Team.where(name: 'TBD').pluck(:id))
    @chicago_final_match = Tournament.last.tournament_groups[0].tournament_rounds.last.matches[0]
    @brooklyn_final_match = Tournament.last.tournament_groups[1].tournament_rounds.last.matches[0]
    @chi_bkl_final_match = Tournament.last.tournament_groups[2].tournament_rounds.last.matches[0]
  end
end
