class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|

      t.timestamps
    end
  end
end
