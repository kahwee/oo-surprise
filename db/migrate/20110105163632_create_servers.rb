class CreateServers < ActiveRecord::Migration
  def self.up
    create_table :servers do |t|
      t.string :name, :limit => 31, :null => false
      t.string :description, :limit => 511
      t.integer :server_type_id, :null => false
      t.timestamps
    end
    add_index :servers, ["name"], :name => "index_servers_on_name", :unique => true

    create_table :server_types do |t|
      t.string :name, :limit => 31, :null => false
      t.string :description, :limit => 511
      t.timestamps
    end
    add_index :server_types, ["name"], :name => "index_server_types_on_name", :unique => true

    create_table :categories do |t|
      t.string :name, :limit => 31, :null => false
      t.string :description, :limit => 511
      t.integer :server_type_id, :null => false
      t.timestamps
    end
    add_index :categories, ["name", "server_type_id"], :name => "index_categories_on_name", :unique => true

    create_table :tasks do |t|
      t.string :name, :limit => 31, :null => false
      t.string :description, :limit => 511
      t.integer :category_id, :null => false
      t.timestamps
    end
    add_index :tasks, ["name", "category_id"], :name => "index_tasks_on_name_and_category_id", :unique => true

    create_table :users do |t|
      t.string :principal_name, :limit => 127, :null => false
      t.string :display_name, :limit => 63
      t.string :short_name, :limit => 15
      t.timestamps
    end
    add_index :users, ["principal_name"], :name => "index_users_on_principal_name", :unique => true
  end

  def self.down
    drop_table :servers
    drop_table :server_types
    drop_table :categories
    drop_table :tasks
    drop_table :users
  end
end
