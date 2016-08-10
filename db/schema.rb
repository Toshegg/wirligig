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

ActiveRecord::Schema.define(version: 20160523214049) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "country_id"
    t.integer  "living_cost"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cost_from"
    t.integer  "cost_to"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "message"
    t.string   "entity_type"
    t.integer  "entity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: :cascade do |t|
    t.integer "info_id"
    t.string  "name"
    t.integer "price"
  end

  create_table "courses_exams", force: :cascade do |t|
    t.integer "course_id"
    t.integer "exam_id"
  end

  create_table "courses_graduates", force: :cascade do |t|
    t.integer "course_id"
    t.integer "graduate_id"
  end

  create_table "exams", force: :cascade do |t|
    t.string "name"
  end

  create_table "graduates", force: :cascade do |t|
    t.string "name"
  end

  create_table "infos", force: :cascade do |t|
    t.string   "web_site"
    t.text     "note"
    t.integer  "language_code_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "university_id"
    t.string   "name"
  end

  create_table "infos_study_languages", force: :cascade do |t|
    t.integer "info_id"
    t.integer "study_language_id"
  end

  create_table "language_codes", force: :cascade do |t|
    t.string "name"
  end

  create_table "payments", force: :cascade do |t|
    t.text     "notification_params"
    t.string   "status"
    t.string   "transaction_id"
    t.datetime "purchased_at"
    t.integer  "user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "university_id"
    t.string   "category"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "study_languages", force: :cascade do |t|
    t.string "name"
  end

  create_table "universities", force: :cascade do |t|
    t.integer  "country_id"
    t.integer  "city_id"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.boolean  "foreign_students",   default: false
    t.datetime "admission_from"
    t.datetime "admission_to"
    t.datetime "pass_exams_from"
    t.datetime "pass_exams_to"
    t.boolean  "provides_dormitory", default: false
    t.boolean  "show_name",          default: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.json     "tokens"
    t.boolean  "is_admin",               default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_partner",             default: false
    t.boolean  "is_paid",                default: false
    t.string   "uuid"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

  create_table "wishlists", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "university_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
