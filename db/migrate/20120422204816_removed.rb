class Removed < ActiveRecord::Migration
  def up
   remove_column :clients, :project_id

  end

  def down
  end
end
