class DropSprintstories < ActiveRecord::Migration
  def up
    drop_table :sprintstories
  end

  def down
  end
end
