class CreateSeasons < ActiveRecord::Migration[5.1]
  def change
    create_table :seasons do |t|
      t.string :name
      t.date :start_date
      t.date :playoff_date
      t.date :banquet_date
    end
  end
end
