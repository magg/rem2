class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
