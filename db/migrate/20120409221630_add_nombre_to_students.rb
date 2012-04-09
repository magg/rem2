class AddNombreToStudents < ActiveRecord::Migration
    def up
      add_column :students, :appat, :string
      add_column :students, :apmat, :string
      remove_column :students, :rol
    end

    def down
    end
  end
