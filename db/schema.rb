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

ActiveRecord::Schema.define(version: 20140928065928) do

  create_table "bills", force: true do |t|
    t.integer  "payer_id"
    t.float    "cost",       limit: 24
    t.string   "subject"
    t.datetime "date"
    t.text     "comment"
    t.integer  "travel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bills", ["travel_id"], name: "index_bills_on_travel_id", using: :btree

  create_table "costs", force: true do |t|
    t.float    "money",      limit: 24
    t.integer  "user_id"
    t.integer  "bill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "travel_users", force: true do |t|
    t.integer  "travel_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "travels", force: true do |t|
    t.string   "name"
    t.string   "creater"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "login"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
