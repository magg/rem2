class Changestories3 < ActiveRecord::Migration
  def up
	change_column :stories, :status_id, :integer, :default => 1
  end

  def down
  end
end
