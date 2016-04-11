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

ActiveRecord::Schema.define(version: 20160411140855) do

  create_table "districts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "favorite_parkings", force: :cascade do |t|
    t.datetime "fec_favorite"
    t.string   "name_space",      limit: 255
    t.integer  "user_id",         limit: 4
    t.integer  "rent_parking_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "favorite_parkings", ["rent_parking_id"], name: "index_favorite_parkings_on_rent_parking_id", using: :btree
  add_index "favorite_parkings", ["user_id"], name: "index_favorite_parkings_on_user_id", using: :btree

  create_table "feedbacks", force: :cascade do |t|
    t.datetime "fec_fedback"
    t.string   "description",        limit: 255
    t.integer  "user_id",            limit: 4
    t.integer  "reserve_parking_id", limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "feedbacks", ["reserve_parking_id"], name: "index_feedbacks_on_reserve_parking_id", using: :btree
  add_index "feedbacks", ["user_id"], name: "index_feedbacks_on_user_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "desDistrict", limit: 255
    t.string   "state",       limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.string   "address",    limit: 255
    t.string   "phone",      limit: 255
    t.datetime "born_at"
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "rent_parkings", force: :cascade do |t|
    t.string   "title",           limit: 255
    t.string   "description",     limit: 255
    t.float    "price",           limit: 24
    t.string   "addres",          limit: 255
    t.string   "phone",           limit: 255
    t.integer  "user_id",         limit: 4
    t.integer  "location_id",     limit: 4
    t.integer  "type_parking_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "rent_parkings", ["location_id"], name: "index_rent_parkings_on_location_id", using: :btree
  add_index "rent_parkings", ["type_parking_id"], name: "index_rent_parkings_on_type_parking_id", using: :btree
  add_index "rent_parkings", ["user_id"], name: "index_rent_parkings_on_user_id", using: :btree

  create_table "rents", force: :cascade do |t|
    t.string   "title",               limit: 255
    t.text     "description",         limit: 65535
    t.float    "price",               limit: 24
    t.string   "addres",              limit: 255
    t.string   "phone",               limit: 255
    t.integer  "user_id",             limit: 4
    t.integer  "district_id",         limit: 4
    t.integer  "type_id",             limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "rents", ["district_id"], name: "index_rents_on_district_id", using: :btree
  add_index "rents", ["type_id"], name: "index_rents_on_type_id", using: :btree
  add_index "rents", ["user_id"], name: "index_rents_on_user_id", using: :btree

  create_table "reserve_parkings", force: :cascade do |t|
    t.datetime "fec_reserve"
    t.date     "fec_ini_reserve"
    t.date     "fec_fin_reserv"
    t.integer  "hor_ini_reserve", limit: 4
    t.integer  "hor_fin_reserve", limit: 4
    t.float    "mont_reserve",    limit: 24
    t.string   "cod_Pay",         limit: 255
    t.string   "state",           limit: 255
    t.integer  "user_id",         limit: 4
    t.integer  "rent_parking_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "reserve_parkings", ["rent_parking_id"], name: "index_reserve_parkings_on_rent_parking_id", using: :btree
  add_index "reserve_parkings", ["user_id"], name: "index_reserve_parkings_on_user_id", using: :btree

  create_table "type_parkings", force: :cascade do |t|
    t.string   "description", limit: 255
    t.string   "state",       limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "types", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "role",                   limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "favorite_parkings", "rent_parkings"
  add_foreign_key "favorite_parkings", "users"
  add_foreign_key "feedbacks", "reserve_parkings"
  add_foreign_key "feedbacks", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "rent_parkings", "locations"
  add_foreign_key "rent_parkings", "type_parkings"
  add_foreign_key "rent_parkings", "users"
  add_foreign_key "rents", "districts"
  add_foreign_key "rents", "types"
  add_foreign_key "rents", "users"
  add_foreign_key "reserve_parkings", "rent_parkings"
  add_foreign_key "reserve_parkings", "users"
end
