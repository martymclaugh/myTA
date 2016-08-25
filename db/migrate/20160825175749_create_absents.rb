class CreateAbsences < ActiveRecord::Migration[5.0]
  def change
    create_table :absences do |t|
      t.boolean :absent

      t.timestamps
    end
  end
end
