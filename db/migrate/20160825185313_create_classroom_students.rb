class CreateClassroomStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :classroom_students do |t|
      t.integer :student_id
      t.integer :classroom_id
    end
  end
end
