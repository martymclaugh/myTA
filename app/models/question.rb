class Question < ApplicationRecord
  has_many :students, through: :student_questions
  has many :student_questions
end
