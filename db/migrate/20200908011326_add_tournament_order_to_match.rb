class AddTournamentOrderToMatch < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :tournament_order, :integer
  end
end
