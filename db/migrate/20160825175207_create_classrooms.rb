class CreateClassrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :classrooms do |t|
      t.string :name
      t.integer :teacher_id

      t.timestamps
    end
  end
end
