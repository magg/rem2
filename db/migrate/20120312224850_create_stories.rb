class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :name
      t.integer :status_id
      t.text :descripcion
      t.integer :functionpts
      t.string :prioridad
      t.string :usuario

      t.timestamps
    end
  end
end
