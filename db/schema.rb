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

ActiveRecord::Schema.define(version: 20180414082651) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.string   "location"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
    t.integer  "consultation_id"
    t.string   "invoice_number"
    t.string   "pupil"
    t.index ["consultation_id"], name: "index_appointments_on_consultation_id", using: :btree
    t.index ["user_id"], name: "index_appointments_on_user_id", using: :btree
  end

  create_table "consultations", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "focus"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "availableday"
    t.string   "consultdur"
    t.string   "consultperiod"
    t.string   "consultfreq"
    t.string   "consultdesc"
    t.string   "matincluded"
    t.string   "consulttype"
    t.decimal  "consultfee",    precision: 19, scale: 2
    t.index ["user_id"], name: "index_consultations_on_user_id", using: :btree
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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "appointments", "consultations"
  add_foreign_key "appointments", "users"
  add_foreign_key "consultations", "users"
  add_foreign_key "messages", "consultations"
  add_foreign_key "messages", "users"
  add_foreign_key "privatemessages", "users"
  add_foreign_key "referrals", "users"
  add_foreign_key "reviews", "consultations"
  add_foreign_key "reviews", "users"
end
