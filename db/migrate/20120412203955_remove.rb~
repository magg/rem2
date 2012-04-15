class Remove < ActiveRecord::Migration
  def up
	remove_column :usuarios, :rol
	add_column :usuarios, :tipo, :string
	add_column :students, :rol, :string
	add_column :projects, :periodo, :string
  end

  def down
  end
end
