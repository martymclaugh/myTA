class StudentQuestion < ApplicationRecord
  belongs_to :student
  belongs_to :question
end
