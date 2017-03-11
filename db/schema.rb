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

ActiveRecord::Schema.define(version: 20170311032932) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins_to_queues", force: :cascade do |t|
    t.integer  "queuee_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["queuee_id"], name: "index_admins_to_queues_on_queuee_id", using: :btree
    t.index ["user_id"], name: "index_admins_to_queues_on_user_id", using: :btree
  end

  create_table "liners_to_queues", force: :cascade do |t|
    t.integer  "queuee_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["queuee_id"], name: "index_liners_to_queues_on_queuee_id", using: :btree
    t.index ["user_id"], name: "index_liners_to_queues_on_user_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "queuees", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "maxUsers"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.integer  "telephone"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
