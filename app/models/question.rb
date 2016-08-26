class Question < ApplicationRecord
  has_many :student_questions
  has_many :students, through: :student_questions
end
