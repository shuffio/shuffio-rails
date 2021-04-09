class AddSwitchColorsAfterFramesToGame < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :change_colors_after_frames, :integer
    add_column :games, :change_colors_every_frames, :integer
  end
end
