class DropGraphics < ActiveRecord::Migration
  def up
	drop_table :graphics
	add_column :workdetails, :fecha, :date
  end

  def down
  end
end
