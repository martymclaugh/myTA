class Absence < ApplicationRecord
  has_many :absence_students
  has_many :students, through: :absence_students
end
