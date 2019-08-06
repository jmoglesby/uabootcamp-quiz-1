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

ActiveRecord::Schema.define(version: 2019_08_06_023412) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "number_of_players"
    t.boolean "leaders_expansion", default: false
    t.boolean "cities_expansion", default: false
    t.boolean "armada_expansion", default: false
    t.boolean "great_projects_expansion", default: false
    t.boolean "babel_expansion", default: false
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "score_cards", force: :cascade do |t|
    t.integer "game_id"
    t.integer "user_id"
    t.integer "plus_one_victory_tokens", default: 0
    t.integer "plus_three_victory_tokens", default: 0
    t.integer "plus_five_victory_tokens", default: 0
    t.integer "plus_seven_victory_tokens", default: 0
    t.integer "minus_one_defeat_tokens", default: 0
    t.integer "minus_two_defeat_tokens", default: 0
    t.integer "minus_three_defeat_tokens", default: 0
    t.integer "coin_total", default: 0
    t.integer "debt_total", default: 0
    t.integer "wonder_points", default: 0
    t.integer "blue_points", default: 0
    t.integer "yellow_points", default: 0
    t.integer "black_points", default: 0
    t.integer "purple_points", default: 0
    t.integer "tablet_science_symbols", default: 0
    t.integer "cog_science_symbols", default: 0
    t.integer "compass_science_symbols", default: 0
    t.integer "wildcard_science_symbols", default: 0
    t.integer "leader_points", default: 0
    t.integer "fleet_points", default: 0
    t.integer "great_project_token_points", default: 0
    t.integer "great_project_penalty_points", default: 0
    t.integer "babel_tiles_played", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_score"
    t.integer "wonder"
    t.index ["game_id"], name: "index_score_cards_on_game_id"
    t.index ["user_id"], name: "index_score_cards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "views", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_views_on_email", unique: true
    t.index ["reset_password_token"], name: "index_views_on_reset_password_token", unique: true
  end

  add_foreign_key "games", "users"
end
