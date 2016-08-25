class StudentClassroom < ApplicationRecord
  belongs_to :student
  belongs_to :classroom
end
