class CreateClassGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :class_groups do |t|
      t.belongs_to :teacher, index: true

      t.timestamps
    end
  end
end
