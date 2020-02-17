class CreateTournamentRounds < ActiveRecord::Migration[6.0]
  def change
    create_table :tournament_rounds do |t|
      t.integer :number
      t.string :name
      t.belongs_to :tournament_group
      t.string :format
    end
  end
end
