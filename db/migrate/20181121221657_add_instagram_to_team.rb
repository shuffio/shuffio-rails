class AddInstagramToTeam < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :image_uri, :string
    add_column :teams, :instagram_user, :string
  end
end
