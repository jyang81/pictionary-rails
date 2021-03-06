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

ActiveRecord::Schema.define(version: 2019_08_12_191842) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chat_messages", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "user_name"
  end

  create_table "game_managers", force: :cascade do |t|
    t.string "command"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "payload", default: [], array: true
  end

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "drawer_id"
    t.string "drawer_name"
    t.string "word"
    t.string "users", default: [], array: true
  end

  create_table "lines", force: :cascade do |t|
    t.string "color"
    t.integer "strokeWidth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "coordinates", default: [], array: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "games_won"
    t.integer "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "words", force: :cascade do |t|
    t.string "word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
