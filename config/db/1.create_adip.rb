class CreateAdip < ActiveRecord::Migration

  def self.up
    create_table :active_queue do |t|
      t.column "message_id", :string
      t.column "queue", :string
      t.column "headers", :binary
      t.column "object", :binary 
    end
    
    create_table :finished_queue do |t|
      t.column "topic", :string
      t.column "headers", :binary
      t.column "object", :binary 
    end
  end

  def self.down
    drop_table :reliable_msg_queues
    drop_table :reliable_msg_topics
  end
end

