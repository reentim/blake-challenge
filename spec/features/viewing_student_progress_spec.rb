require 'rails_helper'

feature "Viewing student progress" do
  let(:enrollment) {
    Enrollment.create!(
      student: Student.create!(name: "Alice"),
      lesson: Lesson.create!(name: "Programming"),
      parts_completed: 3,
    )
  }

  it "displays successfully" do
    visit "/students/#{enrollment.student.id}.json"

    expect(page).to have_content %q{"parts_completed":3}
  end
end
