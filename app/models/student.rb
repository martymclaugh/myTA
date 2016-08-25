class Student < ApplicationRecord
  has_and_belongs_to_many :classrooms
  has_and_belongs_to_many :absences
  has_and_belongs_to_many :questions
end
