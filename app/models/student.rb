class Student < ApplicationRecord
  has_many :enrollments
  has_many :lessons, through: :enrollments
end
