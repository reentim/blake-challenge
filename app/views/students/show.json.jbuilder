json.enrollment do
  json.student @student
  json.enrollments @student.enrollments do |enrollment|
    json.enrollment enrollment
  end
end
