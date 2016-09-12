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

ActiveRecord::Schema.define(version: 20160723200519) do

  create_table "docflow", force: :cascade do |t|
    t.integer  "docid",             precision: 38
    t.integer  "docyear",           precision: 38
    t.string   "docnumber"
    t.integer  "abonent_number",    precision: 38
    t.string   "abonent"
    t.string   "abonent_address"
    t.integer  "consumer_category", precision: 38
    t.datetime "appeal_date"
    t.binary   "attach_5_1"
    t.binary   "attach_5_2"
    t.binary   "attach_5_3"
    t.integer  "case_id",           precision: 38
    t.integer  "stage",             precision: 38
    t.datetime "stage_1_date"
    t.datetime "stage_2_date"
    t.datetime "stage_3_date"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "log", force: :cascade do |t|
    t.string   "service"
    t.integer  "service_id",             precision: 38
    t.string   "action"
    t.boolean  "success",    limit: nil
    t.string   "error"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "queue", force: :cascade do |t|
    t.string   "service"
    t.integer  "service_id", precision: 38
    t.integer  "stage",      precision: 38
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

end
