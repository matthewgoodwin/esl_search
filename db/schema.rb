# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_15_100329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "invoice_number"
    t.string "pupil"
    t.integer "lesson_id"
    t.bigint "consultation_id"
    t.index ["consultation_id"], name: "index_appointments_on_consultation_id"
    t.index ["lesson_id"], name: "index_appointments_on_lesson_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "clients", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id"
    t.integer "user_id"
    t.index ["client_id"], name: "index_clients_on_client_id"
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "consultations", force: :cascade do |t|
    t.bigint "user_id"
    t.string "consult_title"
    t.string "consult_type"
    t.string "consult_language"
    t.string "consult_period"
    t.string "consult_sec_lang"
    t.string "consult_demo"
    t.text "consult_desc"
    t.text "consult_focus"
    t.string "consult_city"
    t.string "consult_mat"
    t.string "address"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "consult_fee", precision: 19, scale: 2
    t.string "consult_env"
    t.string "consult_zoom_link"
    t.string "consult_ratio"
    t.index ["user_id"], name: "index_consultations_on_user_id"
  end

  create_table "job_posts", force: :cascade do |t|
    t.string "job_lang"
    t.string "job_type"
    t.string "job_demo"
    t.string "job_period"
    t.string "job_env"
    t.integer "job_expert"
    t.text "job_desc"
    t.decimal "job_fee_low", precision: 19, scale: 2
    t.decimal "job_fee_high", precision: 19, scale: 2
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_job_posts_on_user_id"
  end

  create_table "lessons", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "lesson_dow", default: [], array: true
    t.datetime "lesson_terminate"
    t.integer "lesson_section"
    t.string "lesson_level"
    t.integer "lesson_capacity"
    t.text "lesson_enrollment", default: [], array: true
    t.datetime "lesson_start"
    t.datetime "lesson_end"
    t.integer "lesson_max_dur"
    t.bigint "consultation_id"
    t.string "remote_link"
    t.index ["consultation_id"], name: "index_lessons_on_consultation_id"
  end

  create_table "messages", id: :serial, force: :cascade do |t|
    t.string "subject"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.text "textmess"
    t.bigint "consultation_id"
    t.index ["consultation_id"], name: "index_messages_on_consultation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "privatemessages", id: :serial, force: :cascade do |t|
    t.string "subject"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sender_id"
    t.text "pm"
    t.index ["sender_id"], name: "index_privatemessages_on_sender_id"
    t.index ["user_id"], name: "index_privatemessages_on_user_id"
  end

  create_table "receipts", id: :serial, force: :cascade do |t|
    t.string "invoice_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "consultation_id"
    t.index ["consultation_id"], name: "index_receipts_on_consultation_id"
  end

  create_table "referrals", id: :serial, force: :cascade do |t|
    t.integer "star"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "comment"
    t.index ["user_id"], name: "index_referrals_on_user_id"
  end

  create_table "reviews", id: :serial, force: :cascade do |t|
    t.string "comment"
    t.integer "star"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "review_title"
    t.bigint "consultation_id"
    t.index ["consultation_id"], name: "index_reviews_on_consultation_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.string "fname"
    t.string "lname"
    t.string "address"
    t.string "gender"
    t.string "subjectmajor"
    t.string "edulevel"
    t.string "photo"
    t.string "instructor_reg"
    t.string "edu"
    t.string "user_native_lang"
    t.string "user_second_lang"
    t.string "user_nation"
    t.string "user_phone"
    t.string "user_kakao_id"
    t.text "aboutme"
    t.string "town"
    t.string "username"
    t.string "color"
    t.integer "expert"
    t.integer "degree"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appointments", "consultations"
  add_foreign_key "appointments", "lessons"
  add_foreign_key "appointments", "users"
  add_foreign_key "clients", "users"
  add_foreign_key "consultations", "users"
  add_foreign_key "job_posts", "users"
  add_foreign_key "lessons", "consultations"
  add_foreign_key "messages", "consultations"
  add_foreign_key "messages", "users"
  add_foreign_key "privatemessages", "users"
  add_foreign_key "receipts", "consultations"
  add_foreign_key "referrals", "users"
  add_foreign_key "reviews", "consultations"
  add_foreign_key "reviews", "users"
end
