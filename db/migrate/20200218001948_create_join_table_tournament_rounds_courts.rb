class CreateJoinTableTournamentRoundsCourts < ActiveRecord::Migration[6.0]
  def change
    create_join_table :tournament_rounds, :courts
  end
end
