require 'rails_helper'

feature "Teacher report" do
  let!(:enrollment) {
    Enrollment.create!(
      student: Student.create!(name: "Alice"),
      lesson: Lesson.create!(name: "Programming"),
      class_group: ClassGroup.create!(
        teacher: Teacher.create!(name: "Mr. Bob"),
      )
    )
  }

  it "allows teachers to view student progress" do
    visit "/teachers/#{enrollment.class_group.teacher.id}/reports/student_progress"

    expect(page).to have_content(enrollment.student.name)
  end
end
