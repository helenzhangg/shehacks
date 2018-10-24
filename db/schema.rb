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

ActiveRecord::Schema.define(version: 2018_10_24_151737) do

  create_table "candidates", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.boolean "full_duration"
    t.integer "experience"
    t.integer "first_preference_id"
    t.integer "second_preference_id"
  end

  create_table "first_preferences", force: :cascade do |t|
    t.string "title"
  end

  create_table "second_preferences", force: :cascade do |t|
    t.string "title"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.string "password"
    t.string "password_digest"
    t.boolean "admin", default: true
    t.integer "access_level", default: 0
    t.string "username"
    t.string "phone"
  end

end
