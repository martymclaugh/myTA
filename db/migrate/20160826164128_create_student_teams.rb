class CreateStudentTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :student_teams do |t|
      t.integer :student_id
      t.integer :team_id

      t.timestamps
    end
  end
end
