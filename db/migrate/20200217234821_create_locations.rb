class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address_line1
      t.string :address_line2
      t.string :address_city
      t.string :address_state
      t.string :address_zip
      t.string :address_country
      t.string :timezone
      t.string :uri
    end
  end
end
