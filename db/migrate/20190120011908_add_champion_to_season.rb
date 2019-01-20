class AddChampionToSeason < ActiveRecord::Migration[5.2]
  def change
    add_column :seasons, :champion_id, :integer, default: nil
  end
end
