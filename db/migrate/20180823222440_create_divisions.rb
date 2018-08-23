class CreateDivisions < ActiveRecord::Migration[5.1]
  def change
    create_table :divisions do |t|
      t.string :name
      t.integer :day_of_week
      t.time :time
    end
  end
end
