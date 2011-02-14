class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.integer  :pivotal_id
      t.datetime :accpeted_at
      t.integer  :project_id
      t.string   :name
      t.text     :description
      t.string   :story_type
      t.integer  :estimate
      t.string   :current_state
      t.string   :requested_by
      t.string   :owned_by
      t.text     :labels
      t.string   :client_no
      t.string   :job_no
      t.integer  :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :stories
  end
end
