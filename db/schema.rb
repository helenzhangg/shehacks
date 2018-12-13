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

ActiveRecord::Schema.define(version: 2018_12_13_032949) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "aspirations", force: :cascade do |t|
    t.string "title"
  end

  create_table "aspirations_candidates", id: false, force: :cascade do |t|
    t.integer "candidate_id"
    t.integer "aspiration_id"
    t.index ["aspiration_id"], name: "index_aspirations_candidates_on_aspiration_id"
    t.index ["candidate_id"], name: "index_aspirations_candidates_on_candidate_id"
  end

  create_table "candidates", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.boolean "full_duration"
    t.integer "experience"
    t.integer "first_preference_id"
    t.integer "second_preference_id"
    t.integer "education_id"
    t.integer "age"
    t.string "preferred_age"
    t.string "pronouns"
    t.string "school"
    t.string "school_type"
    t.string "major"
    t.string "graduation"
    t.string "traveling_from"
    t.text "proficiencies"
    t.boolean "first_hackathon"
    t.text "meaning"
    t.string "resume"
    t.string "linkedin"
    t.string "github"
    t.string "website"
    t.string "source"
    t.string "roles"
    t.string "hexperience"
    t.string "dietary_restrictions"
    t.string "tshirt_size"
    t.string "hackathon_count"
    t.boolean "travel_reimbursement_requested", default: false
    t.boolean "matching_optin", default: false
    t.boolean "foreign_country", default: false
    t.text "most_experienced"
    t.text "tinterests"
    t.text "motivations"
    t.text "focus"
    t.string "background_preference"
    t.text "additional_info"
    t.text "aexperience"
  end

  create_table "candidates_interests", id: false, force: :cascade do |t|
    t.integer "candidate_id"
    t.integer "interest_id"
    t.index ["candidate_id"], name: "index_candidates_interests_on_candidate_id"
    t.index ["interest_id"], name: "index_candidates_interests_on_interest_id"
  end

  create_table "candidates_peducations", id: false, force: :cascade do |t|
    t.integer "candidate_id"
    t.integer "peducation_id"
    t.index ["candidate_id"], name: "index_candidates_peducations_on_candidate_id"
    t.index ["peducation_id"], name: "index_candidates_peducations_on_peducation_id"
  end

  create_table "candidates_preferred_skills", id: false, force: :cascade do |t|
    t.integer "candidate_id"
    t.integer "preferred_skill_id"
    t.index ["candidate_id"], name: "index_candidates_preferred_skills_on_candidate_id"
    t.index ["preferred_skill_id"], name: "index_candidates_preferred_skills_on_preferred_skill_id"
  end

  create_table "candidates_themes", id: false, force: :cascade do |t|
    t.integer "candidate_id"
    t.integer "theme_id"
    t.index ["candidate_id"], name: "index_candidates_themes_on_candidate_id"
    t.index ["theme_id"], name: "index_candidates_themes_on_theme_id"
  end

  create_table "educations", force: :cascade do |t|
    t.string "title"
  end

  create_table "first_preferences", force: :cascade do |t|
    t.string "title"
  end

  create_table "interests", force: :cascade do |t|
    t.string "title"
  end

  create_table "peducations", force: :cascade do |t|
    t.string "title"
  end

  create_table "preferred_skills", force: :cascade do |t|
    t.string "title"
  end

  create_table "second_preferences", force: :cascade do |t|
    t.string "title"
  end

  create_table "themes", force: :cascade do |t|
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
    t.boolean "researcher", default: false
  end

end
