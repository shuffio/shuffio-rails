class CreateGame < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.belongs_to :match
      t.integer :number
      t.belongs_to :yellow_team, class: :team, optional: true
      t.belongs_to :black_team, class: :team, optional: true
      t.json :frames
    end
  end
end
