class CreateTournamentGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :tournament_groups do |t|
      t.string :name
      t.belongs_to :tournament
    end
  end
end
