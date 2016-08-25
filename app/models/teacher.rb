class Teacher < ApplicationRecord
  has_secure_password
  has_many :classrooms
end
