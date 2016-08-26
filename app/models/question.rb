class Question < ApplicationRecord
  has many :student_questions
  has_many :students, through: :student_questions
end
