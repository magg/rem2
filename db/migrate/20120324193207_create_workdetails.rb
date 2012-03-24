class CreateWorkdetails < ActiveRecord::Migration
  def change
    create_table :workdetails do |t|
      t.integer :task_id
      t.integer :hrstrabajadas
      t.integer :hrsporterminar

      t.timestamps
    end
  end
end
