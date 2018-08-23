class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.string :location
      t.datetime :time
      t.integer :home_score
      t.integer :away_score
      t.integer :forfeit, default: 0
      t.boolean :counts_toward_elo, default: true
      t.boolean :league_play, default: false

      t.references :teams, :home_team, index: false
      t.references :teams, :away_team, index: false
    end
  end
end
