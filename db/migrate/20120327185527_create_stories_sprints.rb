class CreateStoriesSprints < ActiveRecord::Migration
  def up
    create_table :sprints_stories, :id => false do |t|
      t.integer :sprint_id
      t.integer :story_id
      
    end
  end

  def down
  end
end
