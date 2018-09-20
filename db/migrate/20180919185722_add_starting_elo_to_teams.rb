class AddStartingEloToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :starting_elo, :integer
  end
end
