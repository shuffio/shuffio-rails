class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :former_names
      t.integer :elo_cache
    end
  end
end
