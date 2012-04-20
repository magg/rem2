class AddEmail < ActiveRecord::Migration
  def up
	add_column :usuarios, :email, :string
  end

  def down
  end
end
