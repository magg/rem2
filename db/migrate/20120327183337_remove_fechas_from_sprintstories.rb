class RemoveFechasFromSprintstories < ActiveRecord::Migration
  def up
    remove_column :sprintstories, :fechainicio
    remove_column :sprintstories, :fechafin
    add_column :sprints, :fechainicio, :date
    add_column :sprints, :fechafin, :date
  end

  def down
  end
end
