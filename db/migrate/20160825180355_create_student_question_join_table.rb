class CreateStudentQuestionJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :students, :questions do |t|
      # t.index [:student_id, :question_id]
      # t.index [:question_id, :student_id]
    end
  end
end
