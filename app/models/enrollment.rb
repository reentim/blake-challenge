class Enrollment < ApplicationRecord
  belongs_to :student
  belongs_to :lesson
  belongs_to :class_group

  validate :lesson_part_must_exist

  private

  def lesson_part_must_exist
    unless (0..lesson.parts).include? parts_completed
      errors.add(:parts_completed, "must refer to an existing lesson part")
    end
  end
end
