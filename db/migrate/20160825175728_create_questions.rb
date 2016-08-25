class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.boolean :answer

      t.timestamps
    end
  end
end
