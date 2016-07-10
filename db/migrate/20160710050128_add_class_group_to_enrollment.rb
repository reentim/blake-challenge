class AddClassGroupToEnrollment < ActiveRecord::Migration[5.0]
  def change
    add_column :enrollments, :class_group_id, :integer, after: :lesson_id
    add_index :enrollments, :class_group_id
  end
end
