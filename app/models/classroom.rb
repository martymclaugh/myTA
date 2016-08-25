class Classroom < ApplicationRecord
  belongs_to :teacher
  has_many :students, through: :student_classroom_join_table
end
