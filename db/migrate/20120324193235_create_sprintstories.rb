class CreateSprintstories < ActiveRecord::Migration
  def change
    create_table :sprintstories do |t|
      t.integer :sprint_id
      t.integer :story_id
      t.date :fechainicio
      t.date :fechafin

      t.timestamps
    end
  end
end
