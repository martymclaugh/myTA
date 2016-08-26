class AbsenceStudent < ApplicationRecord
  belongs_to :student
  belongs_to :absence
end
