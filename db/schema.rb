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

ActiveRecord::Schema.define(version: 2018_11_21_221657) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "divisions", force: :cascade do |t|
    t.string "name"
    t.integer "day_of_week"
    t.string "time"
    t.bigint "season_id"
    t.text "final_standings"
    t.index ["season_id"], name: "index_divisions_on_season_id"
  end

  create_table "divisions_teams", id: false, force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "division_id", null: false
    t.index ["division_id", "team_id"], name: "index_divisions_teams_on_division_id_and_team_id"
    t.index ["team_id", "division_id"], name: "index_divisions_teams_on_team_id_and_division_id"
  end

  create_table "matches", force: :cascade do |t|
    t.string "location"
    t.datetime "time"
    t.integer "home_score"
    t.integer "away_score"
    t.boolean "counts_toward_elo", default: true
    t.bigint "home_team_id"
    t.bigint "away_team_id"
    t.bigint "division_id"
    t.string "comment"
    t.integer "home_old_elo"
    t.integer "home_new_elo"
    t.integer "away_old_elo"
    t.integer "away_new_elo"
    t.index ["division_id"], name: "index_matches_on_division_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "playoff_date"
    t.date "banquet_date"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "former_names"
    t.integer "elo_cache"
    t.string "captain"
    t.integer "starting_elo"
    t.integer "previous_elo"
    t.string "short_name"
    t.integer "starting_match_count"
    t.string "image_uri"
    t.string "instagram_user"
  end

  add_foreign_key "divisions", "seasons"
end
