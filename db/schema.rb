# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110105163632) do

  create_table "categories", :force => true do |t|
    t.string   "name",           :limit => 31,  :null => false
    t.string   "description",    :limit => 511
    t.integer  "server_type_id",                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["name", "server_type_id"], :name => "index_categories_on_name", :unique => true

  create_table "server_types", :force => true do |t|
    t.string   "name",        :limit => 31,  :null => false
    t.string   "description", :limit => 511
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "server_types", ["name"], :name => "index_server_types_on_name", :unique => true

  create_table "servers", :force => true do |t|
    t.string   "name",           :limit => 31,  :null => false
    t.string   "description",    :limit => 511
    t.integer  "server_type_id",                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "servers", ["name"], :name => "index_servers_on_name", :unique => true

  create_table "tasks", :force => true do |t|
    t.string   "name",        :limit => 31,  :null => false
    t.string   "description", :limit => 511
    t.integer  "category_id",                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["name", "category_id"], :name => "index_tasks_on_name_and_category_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "principal_name", :limit => 127, :null => false
    t.string   "display_name",   :limit => 63
    t.string   "short_name",     :limit => 15
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["principal_name"], :name => "index_users_on_principal_name", :unique => true

end
