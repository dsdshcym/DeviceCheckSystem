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

ActiveRecord::Schema.define(version: 20160607013223) do

  create_table "check_plans", force: :cascade do |t|
    t.string   "name"
    t.integer  "interval"
    t.string   "remark"
    t.integer  "device_type_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "check_plans", ["device_type_id"], name: "index_check_plans_on_device_type_id"

  create_table "check_records", force: :cascade do |t|
    t.date     "date"
    t.time     "time_usage"
    t.string   "note"
    t.integer  "device_plan_id"
    t.integer  "engineer_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "check_records", ["device_plan_id"], name: "index_check_records_on_device_plan_id"
  add_index "check_records", ["engineer_id"], name: "index_check_records_on_engineer_id"

  create_table "device_plans", force: :cascade do |t|
    t.date     "scheduled_date"
    t.string   "status"
    t.integer  "device_id"
    t.integer  "check_plan_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "device_plans", ["check_plan_id"], name: "index_device_plans_on_check_plan_id"
  add_index "device_plans", ["device_id"], name: "index_device_plans_on_device_id"

  create_table "device_types", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devices", force: :cascade do |t|
    t.string   "name"
    t.string   "model"
    t.string   "location"
    t.integer  "device_type_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "devices", ["device_type_id"], name: "index_devices_on_device_type_id"

  create_table "engineers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
