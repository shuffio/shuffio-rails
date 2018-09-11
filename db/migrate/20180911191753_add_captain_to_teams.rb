class AddCaptainToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :captain, :string
  end
end
