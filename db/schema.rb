# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_14_175422) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "fish_id", null: false
    t.date "start_at"
    t.date "end_at"
    t.integer "current_cost"
    t.string "current_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fish_id"], name: "index_bookings_on_fish_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "fish", force: :cascade do |t|
    t.string "name"
    t.integer "price_per_week"
    t.string "colour"
    t.integer "length"
    t.bigint "fish_type_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "available"
    t.index ["fish_type_id"], name: "index_fish_on_fish_type_id"
    t.index ["user_id"], name: "index_fish_on_user_id"
  end

  create_table "fish_types", force: :cascade do |t|
    t.string "common_name"
    t.string "scientific_name"
    t.string "origin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "fish"
  add_foreign_key "bookings", "users"
  add_foreign_key "fish", "fish_types"
  add_foreign_key "fish", "users"
end
