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

ActiveRecord::Schema.define(version: 20140612210600) do

  create_table "campaigns", force: true do |t|
    t.string   "title"
    t.decimal  "total",      precision: 20, scale: 6, default: 0.0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "campaigns", ["id"], name: "index_campaigns_on_id", using: :btree
  add_index "campaigns", ["user_id"], name: "index_campaigns_on_user_id", using: :btree

  create_table "contributions", force: true do |t|
    t.decimal  "amount",      precision: 20, scale: 6, default: 0.0
    t.integer  "user_id"
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contributions", ["campaign_id"], name: "index_contributions_on_campaign_id", using: :btree
  add_index "contributions", ["id"], name: "index_contributions_on_id", using: :btree
  add_index "contributions", ["user_id"], name: "index_contributions_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.integer  "login_count", default: 0
    t.boolean  "admin",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end