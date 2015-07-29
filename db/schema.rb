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

ActiveRecord::Schema.define(version: 20150729200803) do

# Could not dump table "folders" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "pictures", force: :cascade do |t|
    t.string   "picture"
    t.text     "description"
    t.integer  "order"
    t.integer  "folder_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.integer  "user_id"
  end

  add_index "pictures", ["folder_id", "order"], name: "index_pictures_on_folder_id_and_order"
  add_index "pictures", ["folder_id"], name: "index_pictures_on_folder_id"
  add_index "pictures", ["user_id"], name: "index_pictures_on_user_id"

  create_table "slideslots", force: :cascade do |t|
    t.string   "picture"
    t.integer  "user_id"
    t.integer  "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "picture_id"
    t.string   "caption"
  end

  add_index "slideslots", ["user_id"], name: "index_slideslots_on_user_id"

  create_table "snapshots", force: :cascade do |t|
    t.string   "title"
    t.string   "image"
    t.integer  "picture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "snapshots", ["picture_id"], name: "index_snapshots_on_picture_id"

  create_table "thumbnails", force: :cascade do |t|
    t.string   "pic"
    t.string   "title"
    t.integer  "picture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "thumbnails", ["picture_id"], name: "index_thumbnails_on_picture_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin",           default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
