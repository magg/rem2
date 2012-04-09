class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :nombre
      t.string :descripcion

      t.timestamps
    end
  end
end
