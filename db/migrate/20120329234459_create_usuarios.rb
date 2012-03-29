class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :username
      t.string :password_digest
      t.string :nombre
      t.string :apellido
      t.string :tipo

      t.timestamps
    end
  end
end
