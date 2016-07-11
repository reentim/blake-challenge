FactoryGirl.define do
  factory :enrollment do
    class_group
    student
    lesson

    trait :lesson_completed do
      parts_completed 3
    end
  end

  factory :class_group do
    teacher
  end

  factory :student do
    name { Faker::Name.name }
  end

  factory :lesson do
    name { Faker::Educator.course }
    parts 3
  end

  factory :teacher do
    name { "Mr. #{Faker::Name.last_name}" }
  end
end
