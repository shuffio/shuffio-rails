class ChangeTypeOnDivisionTime < ActiveRecord::Migration[5.2]
  def change
    change_column :divisions, :time, :string
  end
end
