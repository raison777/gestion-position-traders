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

ActiveRecord::Schema.define(version: 20150807171904) do

  create_table "a_ctions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "a_ctions", ["name"], name: "index_a_ctions_on_name"

  create_table "actions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "actions", ["name"], name: "index_actions_on_name"

  create_table "traders", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "traders", ["name"], name: "index_traders_on_name"

  create_table "trades", force: :cascade do |t|
    t.integer  "quantity"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "trader_id"
    t.integer  "action_id"
    t.float    "price"
  end

  add_index "trades", ["date"], name: "index_trades_on_date"

  create_table "transactions", force: :cascade do |t|
    t.integer  "trader_id"
    t.integer  "action_id"
    t.integer  "quantity"
    t.integer  "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "transactions", ["date"], name: "index_transactions_on_date"

end
