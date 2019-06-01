class AddLiveEvent < ActiveRecord::Migration[5.2]
  def change
    create_table :live_events do |t|
      t.boolean :show_bracket, default: false
      t.belongs_to :left_game, class: :game, optional: true
      t.belongs_to :right_game, class: :game, optional: true
    end
  end
end
