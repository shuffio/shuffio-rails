class AddPreviousEloToTeam < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :previous_elo, :integer
  end
end
