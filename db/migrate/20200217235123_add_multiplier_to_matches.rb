class AddMultiplierToMatches < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :multiplier, :float, default: 1.0, null: false
  end
end
