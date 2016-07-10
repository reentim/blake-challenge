class Teacher < ApplicationRecord
  has_many :class_groups
  has_many :enrollments, through: :class_groups
  has_many :students, through: :enrollments
end
