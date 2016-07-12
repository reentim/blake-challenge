# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

100.times { Lesson.create!(name: Faker::Educator.course) }
3.times { Teacher.create!(name: "Mr. #{Faker::Name.last_name}") }
9.times { ClassGroup.create!(teacher: Teacher.all.to_a.sample) }

180.times { Student.create!(name: Faker::Name.name)}

Student.all.each do |student|
  class_group = ClassGroup.all.to_a.sample

  Random.rand(1..99).times do |n|
    student.enrollments.new(
      lesson: Lesson.find(n + 1),
      class_group: class_group,
      parts_completed: 3,
    ).save(validate: false)
  end

  student.enrollments.new(
    lesson: Lesson.find(Enrollment.last.lesson.id + 1),
    class_group: class_group,
    parts_completed: Random.rand(3),
  ).save(validate: false)
end
