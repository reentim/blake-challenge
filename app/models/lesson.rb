class Lesson < ApplicationRecord
  has_many :enrollments
  has_many :students, through: :enrollments

  def reference
    "#{id} - #{name}"
  end
end
