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

ActiveRecord::Schema.define(version: 20161007123741) do

  create_table "blocked_seats", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id",    limit: 4
    t.integer  "hall_id",    limit: 4
    t.integer  "screen_id",  limit: 4
    t.integer  "seat_id",    limit: 4
  end

  add_index "blocked_seats", ["hall_id"], name: "index_blocked_seats_on_hall_id", using: :btree
  add_index "blocked_seats", ["screen_id"], name: "index_blocked_seats_on_screen_id", using: :btree
  add_index "blocked_seats", ["seat_id"], name: "index_blocked_seats_on_seat_id", using: :btree
  add_index "blocked_seats", ["user_id"], name: "index_blocked_seats_on_user_id", using: :btree

  create_table "halls", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.text     "title",       limit: 4294967295
    t.text     "director",    limit: 4294967295
    t.text     "cast",        limit: 4294967295
    t.text     "description", limit: 4294967295
    t.text     "duration",    limit: 65535
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "number_of_seats", limit: 4
    t.integer  "user_id",         limit: 4
    t.integer  "show_time_id",    limit: 4
  end

  add_index "reservations", ["show_time_id"], name: "index_reservations_on_show_time_id", using: :btree
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id", using: :btree

  create_table "reserved_seats", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "reservation_id", limit: 4
    t.integer  "seat_id",        limit: 4
  end

  add_index "reserved_seats", ["reservation_id"], name: "index_reserved_seats_on_reservation_id", using: :btree
  add_index "reserved_seats", ["seat_id"], name: "index_reserved_seats_on_seat_id", using: :btree

  create_table "screens", force: :cascade do |t|
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "total_seats",   limit: 4
    t.integer  "total_rows",    limit: 4
    t.integer  "total_columns", limit: 4
    t.integer  "hall_id",       limit: 4
  end

  add_index "screens", ["hall_id"], name: "index_screens_on_hall_id", using: :btree

  create_table "seat_categories", force: :cascade do |t|
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.text     "seat_type",    limit: 4294967295
    t.integer  "starting_row", limit: 4
    t.integer  "ending_row",   limit: 4
  end

  create_table "seat_pricings", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "price",            limit: 4
    t.integer  "seat_id",          limit: 4
    t.integer  "show_time_id",     limit: 4
    t.integer  "seat_category_id", limit: 4
  end

  add_index "seat_pricings", ["seat_category_id"], name: "index_seat_pricings_on_seat_category_id", using: :btree
  add_index "seat_pricings", ["seat_id"], name: "index_seat_pricings_on_seat_id", using: :btree
  add_index "seat_pricings", ["show_time_id"], name: "index_seat_pricings_on_show_time_id", using: :btree

  create_table "seat_selects", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id",    limit: 4
    t.integer  "hall_id",    limit: 4
    t.integer  "screen_id",  limit: 4
    t.integer  "seat_id",    limit: 4
  end

  add_index "seat_selects", ["hall_id"], name: "index_seat_selects_on_hall_id", using: :btree
  add_index "seat_selects", ["screen_id"], name: "index_seat_selects_on_screen_id", using: :btree
  add_index "seat_selects", ["seat_id"], name: "index_seat_selects_on_seat_id", using: :btree
  add_index "seat_selects", ["user_id"], name: "index_seat_selects_on_user_id", using: :btree

  create_table "seats", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "row",              limit: 4
    t.integer  "column",           limit: 4
    t.text     "status",           limit: 65535
    t.integer  "screen_id",        limit: 4
    t.integer  "seat_category_id", limit: 4
  end

  add_index "seats", ["screen_id"], name: "index_seats_on_screen_id", using: :btree
  add_index "seats", ["seat_category_id"], name: "index_seats_on_seat_category_id", using: :btree

  create_table "show_times", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.datetime "date"
    t.datetime "time"
    t.integer  "screen_id",  limit: 4
    t.integer  "movie_id",   limit: 4
  end

  add_index "show_times", ["movie_id"], name: "index_show_times_on_movie_id", using: :btree
  add_index "show_times", ["screen_id"], name: "index_show_times_on_screen_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.boolean  "is_admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "blocked_seats", "halls"
  add_foreign_key "blocked_seats", "screens"
  add_foreign_key "blocked_seats", "seats"
  add_foreign_key "blocked_seats", "users"
  add_foreign_key "reservations", "show_times"
  add_foreign_key "reservations", "users"
  add_foreign_key "reserved_seats", "reservations"
  add_foreign_key "reserved_seats", "seats"
  add_foreign_key "screens", "halls"
  add_foreign_key "seat_pricings", "seat_categories"
  add_foreign_key "seat_pricings", "seats"
  add_foreign_key "seat_pricings", "show_times"
  add_foreign_key "seat_selects", "halls"
  add_foreign_key "seat_selects", "screens"
  add_foreign_key "seat_selects", "seats"
  add_foreign_key "seat_selects", "users"
  add_foreign_key "seats", "screens"
  add_foreign_key "seats", "seat_categories"
  add_foreign_key "show_times", "movies"
  add_foreign_key "show_times", "screens"
end
