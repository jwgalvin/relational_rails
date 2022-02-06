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

ActiveRecord::Schema.define(version: 2022_02_05_002536) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cages", force: :cascade do |t|
    t.string "title"
    t.boolean "is_open"
    t.integer "ferret_count"
    t.integer "ferret_capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cults", force: :cascade do |t|
    t.string "name"
    t.integer "member_size"
    t.boolean "open_enrollment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ferrets", force: :cascade do |t|
    t.string "name"
    t.boolean "is_clean"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "cage_id"
    t.index ["cage_id"], name: "index_ferrets_on_cage_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.boolean "married"
    t.integer "children"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "cult_id"
    t.index ["cult_id"], name: "index_members_on_cult_id"
  end

  add_foreign_key "ferrets", "cages"
  add_foreign_key "members", "cults"
end
