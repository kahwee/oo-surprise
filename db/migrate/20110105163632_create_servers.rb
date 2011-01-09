class CreateServers < ActiveRecord::Migration
  def self.up
    create_table :servers do |t|
      t.string  :name, :limit => 31, :null => false
      t.string  :description, :limit => 511
      t.integer :server_type_id, :null => false
      t.timestamps
    end
    add_index :servers, ["name"], :name => "index_servers_on_name", :unique => true

    create_table :server_types do |t|
      t.string  :name, :limit => 31, :null => false
      t.string  :description, :limit => 511
      t.timestamps
    end
    add_index :server_types, ["name"], :name => "index_server_types_on_name", :unique => true

    create_table :categories do |t|
      t.string  :name, :limit => 31, :null => false
      t.string  :description, :limit => 511
      t.integer :server_type_id, :null => false
      t.timestamps
    end
    add_index :categories, ["name", "server_type_id"], :name => "index_categories_on_name", :unique => true

    create_table :tasks do |t|
      t.string  :name, :limit => 511, :null => false
      t.string  :description, :limit => 511
      t.integer :category_id, :null => false
      t.timestamps
    end
    #add_index :tasks, ["name", "category_id"], :name => "index_tasks_on_name_and_category_id", :unique => true

    create_table :server_task_statuses do |t|
      t.integer :server_id, :null => false
      t.integer :task_id, :null => false
      t.integer :status_id, :null => false, :default => 0
      t.text    :remarks
      t.timestamps
    end
  end

  def self.down
    drop_table :servers
    drop_table :server_task_statuses
    drop_table :server_types
    drop_table :categories
    drop_table :tasks
  end
end
