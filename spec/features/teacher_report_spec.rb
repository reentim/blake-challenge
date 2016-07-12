require 'rails_helper'

feature "Teacher report" do
  let!(:enrollment) { create(:enrollment) }

  it "allows teachers to view student progress" do
    visit "/teachers/#{enrollment.class_group.teacher.id}/reports/student_progress"

    expect(page).to have_content(enrollment.student.name)
  end
end
