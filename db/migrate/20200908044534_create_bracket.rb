class CreateBracket < ActiveRecord::Migration[6.0]
  def change
    create_table :brackets do |t|
      t.belongs_to :user
      t.belongs_to :tournament_group
      t.json :match_data

      t.index [:user_id, :tournament_group_id], unique: true
    end
  end
end
