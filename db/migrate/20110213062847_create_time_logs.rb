class CreateTimeLogs < ActiveRecord::Migration
  def self.up
    create_table :time_logs do |t|
      t.integer :story_id
      t.datetime :start_time
      t.datetime :end_time
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :time_logs
  end
end
