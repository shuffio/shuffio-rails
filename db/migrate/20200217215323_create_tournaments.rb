class CreateTournaments < ActiveRecord::Migration[6.0]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.string :uri
      t.string :format
      t.string :description
    end
  end
end
