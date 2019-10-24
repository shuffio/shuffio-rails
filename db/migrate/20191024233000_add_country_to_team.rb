class AddCountryToTeam < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :country, :string
  end
end
