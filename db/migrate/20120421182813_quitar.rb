class Quitar < ActiveRecord::Migration
  def up
	remove_column :students, :appat, :apmat
	remove_column :admins, :appat, :apmat
	remove_column :clients, :appat, :apmat
	add_column :stories, :project_id, :integer
  end

  def down
  end
end
