class ClassGroup < ApplicationRecord
  has_many :enrollments
  has_many :students, -> { distinct }, through: :enrollments
  belongs_to :teacher
end
