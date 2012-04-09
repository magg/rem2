class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :nombre
      t.string :appat
      t.string :apmat

      t.timestamps
    end
  end
end
