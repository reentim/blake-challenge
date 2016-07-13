require 'rails_helper'

feature "Setting student progress" do
  before do
    create(:student)
    create(:lesson)
    create(:class_group)
  end

  it "allows students to progress through lessons" do
    visit "/enrollments/new"

    click_on "Create Enrollment"

    expect(page).to have_content "Enrollment created"

    visit "/enrollments/#{Enrollment.last.id}/edit"

    select "1", from: "enrollment_parts_completed"
    click_on "Update Enrollment"

    expect(page).to have_content "Enrollment updated"
  end
end
