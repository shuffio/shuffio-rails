class AddCourtToMatch < ActiveRecord::Migration[6.0]
  def change
    add_belongs_to :matches, :court
  end
end
