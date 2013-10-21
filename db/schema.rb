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

ActiveRecord::Schema.define(version: 20131018181248) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "languages", force: true do |t|
    t.string   "name"
    t.string   "command"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "key"
  end

  create_table "problems", force: true do |t|
    t.string   "name"
    t.string   "description", limit: 10000
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "solutions", force: true do |t|
    t.integer  "problem_id"
    t.integer  "user_id"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "language_id"
    t.boolean  "tested",      default: false
  end

  create_table "test_runs", force: true do |t|
    t.integer  "solution_id"
    t.boolean  "success"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "test_id"
    t.string   "output",      limit: 100000
    t.boolean  "timeout"
  end

  create_table "tests", force: true do |t|
    t.integer  "problem_id"
    t.string   "name"
    t.string   "input"
    t.string   "output"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "api_key"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  add_index "users", ["api_key"], name: "index_users_on_api_key", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
