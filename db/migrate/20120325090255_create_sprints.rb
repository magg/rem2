class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.string :comentario

      t.timestamps
    end
  end
end
