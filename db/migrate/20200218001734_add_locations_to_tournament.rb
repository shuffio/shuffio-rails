class AddLocationsToTournament < ActiveRecord::Migration[6.0]
  def change
    add_belongs_to :tournaments, :location
  end
end
