require 'rails_helper'

describe Enrollment do
  let(:enrollment) { create(:enrollment) }

  it "validates the existence of the lesson part" do
    enrollment.parts_completed = -3

    expect(enrollment).to be_invalid
  end
end
