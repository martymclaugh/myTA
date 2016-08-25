class CreateStudentAbsenceJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :students, :absences do |t|
      t.index [:student_id, :absence_id]
      t.index [:absence_id, :student_id]
    end
  end
end
