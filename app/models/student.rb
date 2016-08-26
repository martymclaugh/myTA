class Student < ApplicationRecord
  has_many :classroom_students
  has_many :absence_students
  has_many :student_questions
  has_many :student_teams
  has_many :teams, through: :student_teams
  has_many :classrooms, through: :classroom_students
  has_many :absences, through: :absence_students
  has_many :questions, through: :student_questions
end
