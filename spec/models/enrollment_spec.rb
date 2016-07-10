require 'rails_helper'

describe Enrollment do
	let(:enrollment) {
		Enrollment.create!(
			student: Student.create!(name: "Alice"),
			lesson: Lesson.create!(name: "Programming"),
		)
	}

	it "validates the existence of the lesson part" do
		enrollment.parts_completed = -3

		expect(enrollment).to be_invalid
	end
end
