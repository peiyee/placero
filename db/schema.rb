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

ActiveRecord::Schema.define(version: 20160201030618) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email",              limit: 100, null: false
    t.string "username",           limit: 50
    t.string "first_name",         limit: 50
    t.string "last_name",          limit: 50
    t.text   "encrypted_password",             null: false
  end

  create_table "categories", force: :cascade do |t|
    t.integer "admin_id"
    t.string  "name",     limit: 50, null: false
  end

  create_table "favourite_lists", force: :cascade do |t|
    t.string  "name",        limit: 100
    t.string  "description", limit: 250
    t.integer "user_id"
  end

  create_table "list_places", force: :cascade do |t|
    t.integer "favourite_list_id"
    t.integer "place_id"
  end

  create_table "place_categories", force: :cascade do |t|
    t.integer "place_id"
    t.integer "category_id"
  end

  create_table "places", force: :cascade do |t|
    t.string   "name",        limit: 100,                          null: false
    t.integer  "user_id"
    t.integer  "address_id"
    t.datetime "verified_at"
    t.string   "description", limit: 250
    t.time     "open_at"
    t.time     "close_at"
    t.string   "phone",       limit: 20
    t.string   "email",       limit: 100
    t.string   "website",     limit: 100
    t.decimal  "latitude",                precision: 10, scale: 6
    t.decimal  "longitude",               precision: 10, scale: 6
    t.json     "avatars"
    t.string   "line",        limit: 50
    t.string   "line2",       limit: 50
    t.string   "postcode",    limit: 10
    t.string   "city",        limit: 50
    t.string   "country",     limit: 50
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.integer  "age"
    t.string   "email"
    t.string   "username"
    t.string   "provider"
    t.string   "uid"
    t.string   "image_url"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "encrypted_password",     default: ""
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
