class CreateEnrollments < ActiveRecord::Migration[5.0]
  def change
    create_table :enrollments do |t|
      t.belongs_to :student, index: true
      t.belongs_to :lesson, index: true
      t.integer :parts_completed, default: 0

      t.timestamps
    end
  end
end
