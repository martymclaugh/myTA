class CreateAbsenceStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :absence_students do |t|
      t.integer :student_id
      t.integer :absence_id
    end
  end
end
