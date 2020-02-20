class AddTournmentRoundToMatch < ActiveRecord::Migration[6.0]
  def change
    add_belongs_to :matches, :tournament_round
  end
end
