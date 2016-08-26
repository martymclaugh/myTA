class Teacher < ApplicationRecord
  has_many :classrooms
  has_secure_password
end
