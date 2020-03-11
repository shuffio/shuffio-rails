class AddFieldsToGame < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :game_type, :integer, default: 0, null: false
    add_column :games, :max_frames, :integer, default: 8
    add_column :games, :max_points, :integer
    add_column :games, :allow_ties, :boolean, default: false, null: false
  end
end
