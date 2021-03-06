# encoding: UTF-8
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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140724111457) do

  create_table "brewery_auth_core_roles", force: true do |t|
    t.string  "name",              limit: 128
    t.string  "authorizable_type", limit: 128
    t.integer "authorizable_id"
    t.integer "parent_id"
    t.boolean "hidden",                        default: true
  end

  add_index "brewery_auth_core_roles", ["name", "authorizable_type", "authorizable_id"], name: "index_brewery_auth_core_roles_unique", unique: true

  create_table "brewery_auth_core_roles_users", id: false, force: true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "brewery_auth_core_roles_users", ["user_id", "role_id"], name: "index_brewery_auth_core_roles_users_id", unique: true

  create_table "brewery_auth_core_users", force: true do |t|
    t.string   "email",                               null: false
    t.string   "family_name"
    t.string   "other_names"
    t.string   "new_email"
    t.boolean  "active",              default: false, null: false
    t.string   "crypted_password",                    null: false
    t.string   "password_salt",                       null: false
    t.string   "persistence_token",                   null: false
    t.string   "perishable_token"
    t.string   "single_access_token"
    t.integer  "login_count",         default: 0,     null: false
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "blocked",             default: false
  end

  add_index "brewery_auth_core_users", ["email"], name: "index_brewery_auth_core_users_on_email", unique: true
  add_index "brewery_auth_core_users", ["perishable_token"], name: "index_brewery_auth_core_users_on_perishable_token", unique: true
  add_index "brewery_auth_core_users", ["persistence_token"], name: "index_brewery_auth_core_users_on_persistence_token", unique: true
  add_index "brewery_auth_core_users", ["single_access_token"], name: "index_brewery_auth_core_users_on_single_access_token", unique: true

end
