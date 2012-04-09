class RemoveNombreFromUsuarios < ActiveRecord::Migration
  def up
    remove_column :usuarios, :nombre
    remove_column :usuarios, :apellido
    rename_column :usuarios, :tipo, :rol
  end

  def down
  end
end
