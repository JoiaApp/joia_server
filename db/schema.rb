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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20161120061135) do

  create_table "entries", :force => true do |t|
    t.integer  "user_id"
    t.integer  "mention_id"
    t.string   "mention_email"
    t.string   "mention_text"
    t.integer  "prompt_id"
    t.boolean  "favorite"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "entries", ["mention_id"], :name => "index_entries_on_mention_id"
  add_index "entries", ["prompt_id"], :name => "index_entries_on_prompt_id"
  add_index "entries", ["user_id"], :name => "index_entries_on_user_id"

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "password"
    t.integer  "business_id"
    t.boolean  "personal"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "guid"
    t.integer  "owner_id"
  end

  add_index "groups", ["business_id"], :name => "index_groups_on_business_id"

  create_table "prompts", :force => true do |t|
    t.boolean  "personal"
    t.boolean  "business"
    t.text     "phrase"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "responses", :force => true do |t|
    t.string   "text"
    t.integer  "prompt_id"
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "responses", ["group_id"], :name => "index_responses_on_group_id"
  add_index "responses", ["prompt_id"], :name => "index_responses_on_prompt_id"
  add_index "responses", ["user_id"], :name => "index_responses_on_user_id"

  create_table "sponsors", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_groups", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_groups", ["group_id", "user_id"], :name => "index_user_groups_on_group_id_and_user_id", :unique => true
  add_index "user_groups", ["group_id"], :name => "index_user_groups_on_group_id"
  add_index "user_groups", ["user_id"], :name => "index_user_groups_on_user_id"

  create_table "user_profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "image"
    t.datetime "reminder_time"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "user_profiles", ["user_id"], :name => "index_user_profiles_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "password"
    t.string   "role"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
