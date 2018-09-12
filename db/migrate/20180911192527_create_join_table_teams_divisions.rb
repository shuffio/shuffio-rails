class CreateJoinTableTeamsDivisions < ActiveRecord::Migration[5.2]
  def change
    create_join_table :teams, :divisions do |t|
      t.index [:team_id, :division_id]
      t.index [:division_id, :team_id]
    end
  end
end
