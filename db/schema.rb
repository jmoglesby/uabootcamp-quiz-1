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

ActiveRecord::Schema.define(version: 2019_08_05_183933) do

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
    t.string "wonder"
    t.integer "plus_one_victory_tokens"
    t.integer "plus_three_victory_tokens"
    t.integer "plus_five_victory_tokens"
    t.integer "plus_seven_victory_tokens"
    t.integer "minus_one_defeat_tokens"
    t.integer "minus_two_defeat_tokens"
    t.integer "minus_three_defeat_tokens"
    t.integer "coin_total"
    t.integer "debt_total"
    t.integer "wonder_points"
    t.integer "blue_points"
    t.integer "yellow_points"
    t.integer "black_points"
    t.integer "purple_points"
    t.integer "tablet_science_symbols"
    t.integer "cog_science_symbols"
    t.integer "compass_science_symbols"
    t.integer "wildcard_science_symbols"
    t.integer "leader_points"
    t.integer "fleet_points"
    t.integer "great_project_token_points"
    t.integer "great_project_penalty_points"
    t.integer "babel_tiles_played"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
