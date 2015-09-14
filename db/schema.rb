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

ActiveRecord::Schema.define(version: 20150914152413) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "check_ins", force: true do |t|
    t.string   "status",     null: false
    t.string   "initials"
    t.string   "comment"
    t.integer  "room_id",    null: false
    t.integer  "tour_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "check_ins", ["room_id"], name: "index_check_ins_on_room_id", using: :btree
  add_index "check_ins", ["tour_id"], name: "index_check_ins_on_tour_id", using: :btree

  create_table "houses", force: true do |t|
    t.string   "house_name", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions", force: true do |t|
    t.integer  "user_id"
    t.integer  "house_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "permissions", ["house_id"], name: "index_permissions_on_house_id", using: :btree
  add_index "permissions", ["user_id"], name: "index_permissions_on_user_id", using: :btree

  create_table "rooms", force: true do |t|
    t.string   "room_name",  null: false
    t.integer  "house_id",   null: false
    t.integer  "num_beds",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rooms", ["house_id"], name: "index_rooms_on_house_id", using: :btree

  create_table "tours", force: true do |t|
    t.boolean  "completed",              default: false
    t.integer  "house_id",                               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "start_img_file_name"
    t.string   "start_img_content_type"
    t.integer  "start_img_file_size"
    t.datetime "start_img_updated_at"
    t.string   "end_img_file_name"
    t.string   "end_img_content_type"
    t.integer  "end_img_file_size"
    t.datetime "end_img_updated_at"
    t.string   "start_img_fingerprint"
    t.string   "end_img_fingerprint"
  end

  add_index "tours", ["house_id"], name: "index_tours_on_house_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",                        null: false
    t.string   "password_digest",                 null: false
    t.string   "session_token",                   null: false
    t.boolean  "superuser",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
