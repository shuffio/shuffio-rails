class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.belongs_to :user, optional: true
    end

    add_reference :users, :player, optional: true

    create_join_table :players, :teams do |t|
      t.index [:player_id, :team_id]
      t.index [:team_id, :player_id]
      t.boolean :primary, default: true
    end
  end
end
