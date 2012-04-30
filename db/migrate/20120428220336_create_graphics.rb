class CreateGraphics < ActiveRecord::Migration
  def change
    create_table :graphics do |t|

      t.timestamps
    end
  end
end
