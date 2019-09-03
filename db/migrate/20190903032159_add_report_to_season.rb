class AddReportToSeason < ActiveRecord::Migration[5.2]
  def change
    add_column :seasons, :report, :text, default: nil
  end
end
