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

ActiveRecord::Schema.define(version: 2020_03_16_092220) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amenities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "amenities_flats", force: :cascade do |t|
    t.bigint "amenity_id"
    t.bigint "flat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amenity_id"], name: "index_amenities_flats_on_amenity_id"
    t.index ["flat_id"], name: "index_amenities_flats_on_flat_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "number_of_guests"
    t.bigint "flat_id"
    t.bigint "traveller_id"
    t.date "date_check_in"
    t.date "date_check_out"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flat_id"], name: "index_bookings_on_flat_id"
    t.index ["traveller_id"], name: "index_bookings_on_traveller_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flats", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "number_of_guests"
    t.string "address_name"
    t.integer "price_per_night"
    t.string "type_of_flat"
    t.bigint "city_id"
    t.bigint "host_id"
    t.string "lat"
    t.string "long"
    t.date "date_check_in"
    t.date "date_check_out"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_flats_on_city_id"
    t.index ["host_id"], name: "index_flats_on_host_id"
  end

  create_table "hosts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_hosts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_hosts_on_reset_password_token", unique: true
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment"
    t.integer "rating"
    t.bigint "flat_id"
    t.bigint "traveller_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flat_id"], name: "index_reviews_on_flat_id"
    t.index ["traveller_id"], name: "index_reviews_on_traveller_id"
  end

  create_table "travellers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_travellers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_travellers_on_reset_password_token", unique: true
  end

  add_foreign_key "amenities_flats", "amenities"
  add_foreign_key "amenities_flats", "flats"
  add_foreign_key "bookings", "flats"
  add_foreign_key "bookings", "travellers"
  add_foreign_key "flats", "cities"
  add_foreign_key "flats", "hosts"
  add_foreign_key "reviews", "flats"
  add_foreign_key "reviews", "travellers"
end
