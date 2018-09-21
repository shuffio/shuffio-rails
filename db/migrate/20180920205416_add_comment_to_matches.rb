class AddCommentToMatches < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :comment, :string
  end
end
