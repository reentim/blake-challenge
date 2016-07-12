class Enrollment < ApplicationRecord
  belongs_to :student
  belongs_to :lesson
  belongs_to :class_group

  validate :lesson_part_must_exist
  validate :prerequisite_part_must_be_completed
  validate :prerequisite_lesson_must_be_completed

  def lesson_completed?
    parts_completed == lesson.parts
  end

  def prerequisite_enrollment
    if id.present?
      student.enrollments.where("id < ?", id).last
    else
      student.enrollments.last
    end
  end

  def prerequisite_part_completed?
    parts_completed - parts_completed_was <= 1
  end

  def prerequisite_lesson_completed?
    lesson == Lesson.first || prerequisite_enrollment.try(:lesson_completed?)
  end

  private

  def lesson_part_must_exist
    unless (0..lesson.parts).include? parts_completed
      errors.add(:parts_completed, "must refer to an existing lesson part")
    end
  end

  def prerequisite_part_must_be_completed
    unless prerequisite_part_completed?
      errors.add(
        :prerequisite_part_incomplete,
        "You must complete the previous lesson part before starting this one"
      )
    end
  end

  def prerequisite_lesson_must_be_completed
    unless prerequisite_lesson_completed?
      errors.add(
        :prerequisite_lesson_incomplete,
        "You must complete the previous lesson before starting this one"
      )
    end
  end
end
