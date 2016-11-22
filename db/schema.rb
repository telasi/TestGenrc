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

ActiveRecord::Schema.define(version: 20161122054804) do

  create_table "cr_outages", force: :cascade do |t|
    t.integer  "break_reason",                 precision: 38
    t.integer  "break_type",                   precision: 38
    t.integer  "abonent_amount",               precision: 38
    t.integer  "disabling_consumer_count",     precision: 38
    t.integer  "jit_switch_on_consumer_count", precision: 38
    t.datetime "break_start_date"
    t.datetime "break_start_time"
    t.string   "info_url"
    t.binary   "attach_2_1"
    t.binary   "attach_2_2"
    t.string   "record_status"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.binary   "disabling_area"
    t.integer  "response_id",                  precision: 38
    t.datetime "log_day"
  end

  create_table "crashoutages", force: :cascade do |t|
    t.binary   "disabling_area"
    t.integer  "break_reason",                  precision: 38
    t.integer  "break_type",                    precision: 38
    t.integer  "abonent_amount",                precision: 38
    t.datetime "break_start_date"
    t.datetime "break_start_time"
    t.string   "self_governed_district_name"
    t.integer  "self_gov_district_ab_count",    precision: 38
    t.datetime "inf_dissemination_actual_date"
    t.datetime "inf_dissemination_actual_time"
    t.string   "record_status"
    t.datetime "log_day"
    t.string   "response_id"
    t.string   "outg_base_description"
    t.string   "outg_comment"
    t.integer  "outg_base_id",                  precision: 38
    t.integer  "stage",                         precision: 38
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "break_reason_comment"
  end

  create_table "cutter", force: :cascade do |t|
    t.integer  "transaction_number",            precision: 38
    t.string   "abonent_number",     limit: 20
    t.string   "abonent"
    t.string   "abonent_address"
    t.integer  "abonent_type",                  precision: 38
    t.datetime "arrear_date"
    t.binary   "attach_3_1"
    t.binary   "attach_3_2"
    t.binary   "attach_3_3"
    t.integer  "response_id",                   precision: 38
    t.integer  "stage",                         precision: 38
    t.datetime "stage_1_date"
    t.datetime "stage_2_date"
    t.datetime "stage_3_date"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  create_table "docflow4", force: :cascade do |t|
    t.integer  "docid",           precision: 38
    t.integer  "docyear",         precision: 38
    t.string   "letter_number"
    t.integer  "abonent_number",  precision: 38
    t.string   "abonent"
    t.string   "abonent_address"
    t.integer  "abonent_type",    precision: 38
    t.datetime "appeal_date"
    t.binary   "attach_4_1"
    t.binary   "attach_4_2"
    t.binary   "attach_4_3"
    t.integer  "response_id",     precision: 38
    t.integer  "stage",           precision: 38
    t.datetime "stage_1_date"
    t.datetime "stage_2_date"
    t.datetime "stage_3_date"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "letter_category", precision: 38
  end

  create_table "docflow5", force: :cascade do |t|
    t.integer  "docid",             precision: 38
    t.integer  "docyear",           precision: 38
    t.string   "letter_number"
    t.integer  "abonent_number",    precision: 38
    t.string   "abonent"
    t.string   "abonent_address"
    t.integer  "consumer_category", precision: 38
    t.datetime "appeal_date"
    t.binary   "attach_5_1"
    t.binary   "attach_5_2"
    t.binary   "attach_5_3"
    t.integer  "response_id",       precision: 38
    t.integer  "stage",             precision: 38
    t.datetime "stage_1_date"
    t.datetime "stage_2_date"
    t.datetime "stage_3_date"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "docflow6", force: :cascade do |t|
    t.integer  "docid",             precision: 38
    t.integer  "docyear",           precision: 38
    t.string   "letter_number"
    t.string   "applicant"
    t.string   "applicant_address"
    t.integer  "abonent_number",    precision: 38
    t.integer  "consumer_category", precision: 38
    t.datetime "appeal_date"
    t.binary   "attach_6_1"
    t.binary   "attach_6_2"
    t.binary   "attach_6_3"
    t.integer  "response_id",       precision: 38
    t.integer  "stage",             precision: 38
    t.datetime "stage_1_date"
    t.datetime "stage_2_date"
    t.datetime "stage_3_date"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "docflow8", force: :cascade do |t|
    t.integer  "docid",             precision: 38
    t.integer  "docyear",           precision: 38
    t.string   "letter_number"
    t.integer  "abonent_number",    precision: 38
    t.string   "abonent"
    t.string   "abonent_address"
    t.integer  "consumer_category", precision: 38
    t.datetime "appeal_date"
    t.binary   "attach_8_1"
    t.binary   "attach_8_2"
    t.binary   "attach_8_3"
    t.integer  "response_id",       precision: 38
    t.integer  "stage",             precision: 38
    t.datetime "stage_1_date"
    t.datetime "stage_2_date"
    t.datetime "stage_3_date"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "log", force: :cascade do |t|
    t.string   "service"
    t.integer  "service_id",              precision: 38
    t.string   "action"
    t.boolean  "success",    limit: nil
    t.string   "error",      limit: 4000
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "newcust", force: :cascade do |t|
    t.string   "letter_number"
    t.string   "applicant"
    t.string   "applicant_address"
    t.string   "voltage"
    t.string   "power"
    t.datetime "appeal_date"
    t.binary   "attach_7_1"
    t.binary   "attach_7_2"
    t.binary   "attach_7_3"
    t.integer  "response_id",                precision: 38
    t.integer  "stage",                      precision: 38
    t.datetime "stage_1_date"
    t.datetime "stage_2_date"
    t.datetime "stage_3_date"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "transaction_number_3"
    t.string   "the_amount_of_compensation"
    t.binary   "attach_7_4"
  end

  create_table "pl_outages", force: :cascade do |t|
    t.string   "break_reason"
    t.datetime "break_start_date"
    t.datetime "break_end_date"
    t.integer  "disabling_consumer_count",       precision: 38
    t.integer  "abonent_amount",                 precision: 38
    t.integer  "jit_infromation_consumer_count", precision: 38
    t.string   "info_url"
    t.binary   "attach_1_1"
    t.binary   "attach_1_2"
    t.binary   "attach_1_4"
    t.string   "record_status"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.datetime "log_day"
    t.binary   "disabling_area"
    t.integer  "response_id",                    precision: 38
  end

  create_table "plannedoutages", force: :cascade do |t|
    t.binary   "disabling_area"
    t.integer  "break_reason",                               precision: 38
    t.datetime "break_start_date"
    t.datetime "break_end_date"
    t.integer  "abonent_amount",                             precision: 38
    t.string   "self_governed_district_name"
    t.string   "self_gov_district_ab_count"
    t.integer  "jit_infromation_consumer_count",             precision: 38
    t.datetime "compare_date_2"
    t.string   "list_of_media"
    t.string   "info_url"
    t.string   "sms"
    t.string   "record_status"
    t.datetime "log_day"
    t.string   "response_id"
    t.string   "outg_base_description"
    t.string   "outg_comment"
    t.string   "outg_base_id",                   limit: 500
    t.decimal  "stage"
    t.string   "break_reason_comment"
  end

  create_table "queue", force: :cascade do |t|
    t.string   "service"
    t.integer  "service_id", precision: 38
    t.integer  "stage",      precision: 38
    t.datetime "sent_at"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

end
