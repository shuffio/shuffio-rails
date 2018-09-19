class UpdateMatches < ActiveRecord::Migration[5.2]
  def change
    remove_column :matches, :forfeit, :integer
    remove_column :matches, :league_play, :boolean
    remove_column :matches, :teams_id, :integer
    add_reference :matches, :division
  end
end
