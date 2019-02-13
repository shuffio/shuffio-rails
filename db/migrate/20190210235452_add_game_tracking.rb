class AddGameTracking < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.belongs_to :match
      t.integer :number
    end

    # TODO: t.references vs t.belongs_to
    create_table :frames do |t|
      t.belongs_to :game
      t.integer :number
      t.belongs_to :yellow_player, class: :user, optional: true
      t.belongs_to :black_player, class: :user, optional: true
      t.integer :yellow_score
      t.integer :black_score
    end

    # remove_column :frames, :users_id, :integer

    create_join_table :users, :teams do |t|
      t.belongs_to :season
      t.boolean :captain
    end
  end
end
