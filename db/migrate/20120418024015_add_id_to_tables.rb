class AddIdToTables < ActiveRecord::Migration
  def change
	add_column :admins, :usuario_id, :integer
	add_column :students, :team_id, :integer
	add_column :clients, :usuario_id, :integer
	add_column :clients, :project_id, :integer
	add_column :teams, :project_id, :integer
  end
end
