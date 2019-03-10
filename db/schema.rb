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

ActiveRecord::Schema.define(version: 20190310082343) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
    t.integer  "consultation_id"
    t.string   "invoice_number"
    t.string   "pupil"
    t.integer  "lesson_id"
    t.index ["consultation_id"], name: "index_appointments_on_consultation_id", using: :btree
    t.index ["lesson_id"], name: "index_appointments_on_lesson_id", using: :btree
    t.index ["user_id"], name: "index_appointments_on_user_id", using: :btree
  end

  create_table "clients", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "client_id"
    t.integer  "user_id"
    t.index ["client_id"], name: "index_clients_on_client_id", using: :btree
    t.index ["user_id"], name: "index_clients_on_user_id", using: :btree
  end

  create_table "consultations", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "matincluded"
    t.decimal  "consultfee",       precision: 19, scale: 2
    t.string   "consult_title"
    t.string   "consult_type"
    t.string   "consult_desc"
    t.string   "consult_focus"
    t.string   "consult_language"
    t.string   "consult_location"
    t.string   "consult_period"
    t.string   "consult_sec_lang"
    t.string   "consult_demo"
    t.index ["user_id"], name: "index_consultations_on_user_id", using: :btree
  end

  create_table "lessons", force: :cascade do |t|
    t.integer  "consultation_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.text     "lesson_dow",        default: [],              array: true
    t.datetime "lesson_terminate"
    t.integer  "lesson_section"
    t.string   "lesson_level"
    t.integer  "lesson_capacity"
    t.text     "lesson_enrollment", default: [],              array: true
    t.datetime "lesson_start"
    t.datetime "lesson_end"
    t.integer  "lesson_max_dur"
    t.index ["consultation_id"], name: "index_lessons_on_consultation_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.string   "subject"
    t.string   "textmess"
    t.integer  "consultation_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
    t.index ["consultation_id"], name: "index_messages_on_consultation_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "privatemessages", force: :cascade do |t|
    t.string   "subject"
    t.string   "pm"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "sender_id"
    t.index ["sender_id"], name: "index_privatemessages_on_sender_id", using: :btree
    t.index ["user_id"], name: "index_privatemessages_on_user_id", using: :btree
  end

  create_table "receipts", force: :cascade do |t|
    t.string   "invoice_num"
    t.integer  "consultation_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["consultation_id"], name: "index_receipts_on_consultation_id", using: :btree
  end

  create_table "referrals", force: :cascade do |t|
    t.string   "comment"
    t.integer  "star"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_referrals_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "comment"
    t.integer  "star"
    t.integer  "consultation_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
    t.string   "review_title"
    t.index ["consultation_id"], name: "index_reviews_on_consultation_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "city"
    t.string   "fname"
    t.string   "lname"
    t.string   "address"
    t.string   "gender"
    t.string   "subjectmajor"
    t.string   "edulevel"
    t.string   "photo"
    t.string   "instructor_reg"
    t.string   "edu"
    t.string   "user_native_lang"
    t.string   "user_second_lang"
    t.string   "user_nation"
    t.string   "user_phone"
    t.string   "user_kakao_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "appointments", "consultations"
  add_foreign_key "appointments", "lessons"
  add_foreign_key "appointments", "users"
  add_foreign_key "clients", "users"
  add_foreign_key "consultations", "users"
  add_foreign_key "lessons", "consultations"
  add_foreign_key "messages", "consultations"
  add_foreign_key "messages", "users"
  add_foreign_key "privatemessages", "users"
  add_foreign_key "receipts", "consultations"
  add_foreign_key "referrals", "users"
  add_foreign_key "reviews", "consultations"
  add_foreign_key "reviews", "users"
end
