class CreateCriterios < ActiveRecord::Migration
  def change
    create_table :criterios do |t|
      t.text :descripcion
      t.integer :story_id

      t.timestamps
    end
  end
end
