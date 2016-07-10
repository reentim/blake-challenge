class Student < ApplicationRecord
  has_many :enrollments
  has_many :lessons, through: :enrollments
  has_many :class_groups, through: :enrollments
  has_many :teachers, through: :class_groups
end
