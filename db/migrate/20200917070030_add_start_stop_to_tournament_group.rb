class AddStartStopToTournamentGroup < ActiveRecord::Migration[6.0]
  def change
    add_column :tournament_groups, :bracket_start_time, :datetime
    add_column :tournament_groups, :bracket_end_time, :datetime
  end
end
