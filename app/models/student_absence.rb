class StudentAbsence < ApplicationRecord
  belongs_to :student
  belongs_to :absence
end
