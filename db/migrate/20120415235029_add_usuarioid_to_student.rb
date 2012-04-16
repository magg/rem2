class AddUsuarioidToStudent < ActiveRecord::Migration
  def change
    add_column :students, :usuario_id, :integer
  end
end
