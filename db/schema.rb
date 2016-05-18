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

ActiveRecord::Schema.define(version: 20160512183111) do

  create_table "appointments", force: :cascade do |t|
    t.integer  "patient_id"
    t.integer  "physician_id"
    t.datetime "fecha"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "reminded"
  end

  add_index "appointments", ["patient_id"], name: "index_appointments_on_patient_id"
  add_index "appointments", ["physician_id"], name: "index_appointments_on_physician_id"

  create_table "patients", force: :cascade do |t|
    t.string   "appat"
    t.string   "apmat"
    t.string   "name"
    t.string   "sex"
    t.decimal  "age"
    t.string   "eciv"
    t.string   "calle"
    t.decimal  "cnum"
    t.string   "tcasa"
    t.string   "tof"
    t.string   "cel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
  end

  create_table "physicians", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "records", force: :cascade do |t|
    t.datetime "fecha"
    t.text     "body"
    t.integer  "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "records", ["patient_id"], name: "index_records_on_patient_id"

  create_table "us_pat_rels", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "us_pat_rels", ["patient_id"], name: "index_us_pat_rels_on_patient_id"
  add_index "us_pat_rels", ["user_id"], name: "index_us_pat_rels_on_user_id"

  create_table "us_phys_rels", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "physician_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "us_phys_rels", ["physician_id"], name: "index_us_phys_rels_on_physician_id"
  add_index "us_phys_rels", ["user_id"], name: "index_us_phys_rels_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "login_count",        default: 0, null: false
    t.integer  "failed_login_count", default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "perishable_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
