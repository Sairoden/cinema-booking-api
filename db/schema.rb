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

ActiveRecord::Schema.define(version: 2021_07_02_072200) do

  create_table "bookings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "movie_id", null: false
    t.string "seat_number"
    t.string "time_slot"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_bookings_on_movie_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "cinema_movies", force: :cascade do |t|
    t.integer "cinema_id", null: false
    t.integer "movie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cinema_id"], name: "index_cinema_movies_on_cinema_id"
    t.index ["movie_id"], name: "index_cinema_movies_on_movie_id"
  end

  create_table "cinemas", force: :cascade do |t|
    t.string "title"
    t.integer "available_seat"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.integer "length"
    t.text "description"
    t.string "genre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "contact"
    t.string "password_digest"
    t.boolean "admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bookings", "movies"
  add_foreign_key "bookings", "users"
  add_foreign_key "cinema_movies", "cinemas"
  add_foreign_key "cinema_movies", "movies"
end
