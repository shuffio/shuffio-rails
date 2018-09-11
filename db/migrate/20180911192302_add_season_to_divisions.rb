class AddSeasonToDivisions < ActiveRecord::Migration[5.2]
  def change
    add_reference :divisions, :season, foreign_key: true
  end
end
