class AddBracket < ActiveRecord::Migration[5.2]
  def change
    create_table :brackets do |t|
      t.string :name
      t.text :match_id_blob
    end

    add_reference :matches, :bracket
  end
end
