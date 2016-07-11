require 'rails_helper'

feature "Viewing student progress" do
  let(:enrollment) { create(:enrollment, :lesson_completed) }

  it "displays successfully" do
    visit "/students/#{enrollment.student.id}.json"

    expect(page).to have_content %q{"parts_completed":3}
  end
end
