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

ActiveRecord::Schema.define(version: 20140727031101) do

  create_table "cbms", force: true do |t|
    t.string   "pur_no"
    t.date     "pur_date"
    t.date     "arr_date"
    t.float    "exp1"
    t.float    "conversion"
    t.float    "exp1a"
    t.float    "exp2"
    t.float    "exp3"
    t.float    "exp4"
    t.float    "exp5"
    t.float    "exp6"
    t.float    "exp7"
    t.float    "exp8"
    t.float    "exp9"
    t.float    "exp10"
    t.float    "no_of_ct"
    t.float    "per_cbm"
    t.float    "cbm1"
    t.float    "arr_cbm"
    t.float    "cbm"
    t.float    "per_cbm_ex"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cost_details", force: true do |t|
    t.string   "refno_model_desc"
    t.float    "last_pur_price"
    t.float    "pur_price"
    t.integer  "qty"
    t.float    "p_com"
    t.float    "inr"
    t.float    "cbm"
    t.float    "cbm_ex"
    t.float    "p_cbm"
    t.float    "per1"
    t.float    "pur2"
    t.float    "sell_price"
    t.float    "last_sell_cbm"
    t.float    "last_sell_price"
    t.string   "last_pur_no"
    t.integer  "cost_id"
    t.integer  "model_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "costs", force: true do |t|
    t.string   "pur_no"
    t.float    "cbm_exp"
    t.float    "per1"
    t.float    "conversion"
    t.datetime "pur_date"
    t.float    "pur2"
    t.datetime "arrivaldate"
    t.integer  "cbm_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "com"
  end

  create_table "models", force: true do |t|
    t.string   "model_no"
    t.text     "description"
    t.float    "pur_price"
    t.float    "cbm"
    t.float    "weight"
    t.float    "selling_price"
    t.integer  "reference_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "models", ["reference_id"], name: "index_models_on_reference_id", using: :btree

  create_table "references", force: true do |t|
    t.string   "ref_no"
    t.text     "note1"
    t.text     "note2"
    t.text     "note3"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "references", ["user_id"], name: "index_references_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
