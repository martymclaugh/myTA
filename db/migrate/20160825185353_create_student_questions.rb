class CreateStudentQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :student_questions do |t|
      t.integer :student_id
      t.integer :question_id
    end
  end
end
