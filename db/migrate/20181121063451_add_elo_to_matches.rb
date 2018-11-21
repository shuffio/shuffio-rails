class AddEloToMatches < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :home_old_elo, :integer
    add_column :matches, :home_new_elo, :integer
    add_column :matches, :away_old_elo, :integer
    add_column :matches, :away_new_elo, :integer
  end
end
