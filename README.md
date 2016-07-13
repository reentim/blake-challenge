# Coding challenge

Ruby on Rails coding challenge.

## Environment

* Ruby 2.3.1
* Rails 5.0.0

## Setup

```
git clone git@github.com:reentim/coding-challenge.git
cd coding-challenge
bundle install
bundle exec rake db:setup
```

## Verifying behaviour

Run the test suite with `bundle exec rspec spec --format documentation`.

To view the application in the browser, ensure the server is running: `bundle
exec rails server --port 3000`.

* http://localhost:3000/enrollments/new
* http://localhost:3000/students/1.json
* http://localhost:3000/teachers/1/reports/student_progress

## Problem description

Company X is developing a new app for student education. Students complete
lessons and their progress is recorded. Each lesson has 3 parts - 1, 2 and 3.
There are 100 lessons in total.

### Part 1

Generate a rails app that persists students and their progress.

Define routes for:

a) setting a student's progress - progress should consist of a lesson and part
number.

b) returning a JSON representation of a student and their associated progress.

### Part 2

Teachers have classes containing number of students.

a) Add a teacher model that is related to students

b) Create a reports page for a teacher to view progress all of their students.

### Part 3

Calculating progress

a) add a method for updating student progress - this should verify that the
student is only able to complete the next part number in sequence e.g.

L1 P1, L1 P2, L1 P3, L2 P1, L2 P2 etc.
