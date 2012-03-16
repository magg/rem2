class Changestories < ActiveRecord::Migration
  def up
	change_column :stories, :status_id, :integer, :default => 0
  end

  def down
  end
end
