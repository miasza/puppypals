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

ActiveRecord::Schema.define(version: 2019_05_23_154004) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dog_reviews", force: :cascade do |t|
    t.bigint "dog_id"
    t.bigint "user_id"
    t.integer "rating"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dog_id"], name: "index_dog_reviews_on_dog_id"
    t.index ["user_id"], name: "index_dog_reviews_on_user_id"
  end

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "breed"
    t.string "size"
    t.integer "price"
    t.string "photo"
    t.text "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_dogs_on_user_id"
  end

  create_table "renter_reviews", force: :cascade do |t|
    t.bigint "dog_id"
    t.bigint "user_id"
    t.integer "rating"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dog_id"], name: "index_renter_reviews_on_dog_id"
    t.index ["user_id"], name: "index_renter_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visits", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "dog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.string "status", default: "pending"
    t.index ["dog_id"], name: "index_visits_on_dog_id"
    t.index ["user_id"], name: "index_visits_on_user_id"
  end

  add_foreign_key "dog_reviews", "dogs"
  add_foreign_key "dog_reviews", "users"
  add_foreign_key "dogs", "users"
  add_foreign_key "renter_reviews", "dogs"
  add_foreign_key "renter_reviews", "users"
  add_foreign_key "visits", "dogs"
  add_foreign_key "visits", "users"
end
