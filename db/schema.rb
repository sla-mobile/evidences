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

ActiveRecord::Schema.define(:version => 20120826064743) do

  create_table "attachments", :force => true do |t|
    t.string   "name"
    t.string   "filename"
    t.integer  "issue_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.string   "title"
    t.text     "details"
    t.string   "parent_type"
    t.integer  "parent_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "issues", :force => true do |t|
    t.string   "title"
    t.text     "details"
    t.string   "risk"
    t.text     "recommendation"
    t.integer  "project_id"
    t.string   "status"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "details"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects_users", :force => true do |t|
    t.integer "user_id"
    t.integer "project_id"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
