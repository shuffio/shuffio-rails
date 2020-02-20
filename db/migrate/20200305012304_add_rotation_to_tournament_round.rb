class AddRotationToTournamentRound < ActiveRecord::Migration[6.0]
  def change
    add_column :tournament_rounds, :rotation, :integer
  end
end
