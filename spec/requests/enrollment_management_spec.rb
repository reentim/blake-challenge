require 'rails_helper'

describe "Enrollment management", type: :request do
  let!(:enrollment) {
    Enrollment.create!(
      student: Student.create!(name: "Alice"),
      lesson: Lesson.create!(name: "Programming"),
    )
  }

  it "allows students to progress through lessons" do
    put "/enrollments/#{enrollment.id}", params: {
      enrollment: { parts_completed: 1 },
      format: :json
    }
    enrollment.reload

    expect(response).to be_success
    expect(enrollment.parts_completed).to eq(1)
  end
end
