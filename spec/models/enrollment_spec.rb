require 'rails_helper'

describe Enrollment do
  let(:enrollment) { create(:enrollment) }

  it "validates the existence of the lesson part" do
    enrollment.parts_completed = -3

    expect(enrollment).to be_invalid
  end

  it "validates the completion of the prerequisite lesson part" do
    enrollment.parts_completed = 3

    expect(enrollment).to be_invalid
  end

  it "validates the completion of the prerequisite lesson" do
    new_enrollment = build(:enrollment, student: enrollment.student)

    expect(new_enrollment).to be_invalid
  end

  describe "#lesson_completed?" do
    context "when the lesson has been completed" do
      let(:enrollment) { create(:enrollment, :lesson_completed) }

      it "returns true" do
        expect(enrollment.lesson_completed?).to be true
      end
    end

    context "when the lesson has not been completed" do
      it "returns false" do
        expect(enrollment.lesson_completed?).to be false
      end
    end
  end

  describe "#prerequisite_enrollment" do
    context "when there is no previous enrollment" do
      it "is nil" do
        expect(enrollment.prerequisite_enrollment).to be nil
      end
    end

    context "when the student has previous enrollments" do
      let(:enrollment_1) { create(:enrollment) }
      let(:enrollment_2) { create(:enrollment) }
      let(:enrollment_3) { build(:enrollment, student: enrollment_1.student) }

      it "returns the student's previous enrollment" do
        expect(enrollment_3.prerequisite_enrollment).to eq(enrollment_1)
      end
    end
  end

  describe "#prerequisite_part_completed?" do
    context "when enrolled in the lesson's first part" do
      it "returns true" do
        expect(enrollment.prerequisite_part_completed?).to be true
      end
    end

    context "when the prerequisite lesson part has been completed" do
      let(:enrollment) { create(:enrollment, :lesson_partially_completed) }

      it "returns true" do
        expect(enrollment.prerequisite_part_completed?).to be true
      end
    end

    context "when the prerequisite lesson part has not been completed" do
      let(:enrollment) { build(:enrollment, parts_completed: 3) }

      it "returns false" do
        expect(enrollment.prerequisite_part_completed?).to be false
      end
    end
  end

  describe "#prerequisite_lesson_completed?" do
    context "when enrolled in the first lesson" do
      it "returns true" do
        expect(enrollment.prerequisite_lesson_completed?).to be true
      end
    end

    context "when the prerequisite lesson has been completed" do
      let(:enrollment_1) { create(:enrollment, :lesson_completed) }
      let(:enrollment_2) { create(:enrollment, student: enrollment_1.student) }

      it "returns true" do
        expect(enrollment_2.prerequisite_lesson_completed?).to be true
      end
    end

    context "when the prerequisite lesson has not been completed" do
      let(:enrollment_1) { create(:enrollment) }
      let(:enrollment_2) { build(:enrollment, student: enrollment_1.student) }

      it "returns false" do
        expect(enrollment_2.prerequisite_lesson_completed?).to be false
      end
    end
  end
end
