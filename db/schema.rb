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

ActiveRecord::Schema.define(:version => 20110107032102) do

  create_table "categories", :force => true do |t|
    t.string   "name",           :limit => 31,  :null => false
    t.string   "description",    :limit => 511
    t.integer  "server_type_id",                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["name", "server_type_id"], :name => "index_categories_on_name", :unique => true

  create_table "server_task_statuses", :force => true do |t|
    t.integer  "server_id",                 :null => false
    t.integer  "task_id",                   :null => false
    t.integer  "status_id",  :default => 0, :null => false
    t.text     "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.string   "name",        :limit => 511, :null => false
    t.string   "description", :limit => 511
    t.integer  "category_id",                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
