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

ActiveRecord::Schema.define(version: 2019_02_10_235452) do

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

  create_table "frames", force: :cascade do |t|
    t.bigint "game_id"
    t.integer "number"
    t.bigint "yellow_player_id"
    t.bigint "black_player_id"
    t.integer "yellow_score"
    t.integer "black_score"
    t.index ["black_player_id"], name: "index_frames_on_black_player_id"
    t.index ["game_id"], name: "index_frames_on_game_id"
    t.index ["yellow_player_id"], name: "index_frames_on_yellow_player_id"
  end

  create_table "games", force: :cascade do |t|
    t.bigint "match_id"
    t.integer "number"
    t.index ["match_id"], name: "index_games_on_match_id"
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
    t.integer "champion_id"
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
    t.integer "starting_wins", default: 0
    t.integer "starting_losses", default: 0
  end

  create_table "teams_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "team_id", null: false
    t.bigint "season_id"
    t.boolean "captain"
    t.index ["season_id"], name: "index_teams_users_on_season_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "provider"
    t.string "uid"
    t.string "first_name"
    t.string "last_name"
    t.boolean "is_admin", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "divisions", "seasons"
end
