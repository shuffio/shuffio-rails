class AddFinalStandingsToDivision < ActiveRecord::Migration[5.2]
  def change
    add_column :divisions, :final_standings, :text
  end
end
