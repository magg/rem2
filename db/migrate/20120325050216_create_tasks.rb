class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :descripcion
      t.integer :estimadoinicial
      t.string :status
      t.integer :story_id
      t.integer :student_id

      t.timestamps
    end
  end
end
