class AddStartingRecordToTeam < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :starting_wins, :integer, default: 0
    add_column :teams, :starting_losses, :integer, default: 0
  end
end
