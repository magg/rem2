class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :nombre
      t.string :appat
      t.string :apmat

      t.timestamps
    end
  end
end
