class ClassroomStudent < ApplicationRecord
  belongs_to :student
  belongs_to :classroom
end
