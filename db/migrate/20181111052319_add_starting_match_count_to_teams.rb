class AddStartingMatchCountToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :starting_match_count, :integer
  end
end
