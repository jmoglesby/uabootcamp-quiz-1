class CreateScoreCards < ActiveRecord::Migration[5.2]
  def change
    create_table :score_cards do |t|
      t.integer :game_id
      t.integer :user_id

      t.string :wonder
      t.integer :plus_one_victory_tokens
      t.integer :plus_three_victory_tokens
      t.integer :plus_five_victory_tokens
      t.integer :plus_seven_victory_tokens
      t.integer :minus_one_defeat_tokens
      t.integer :minus_two_defeat_tokens
      t.integer :minus_three_defeat_tokens
      t.integer :coin_total
      t.integer :debt_total
      t.integer :wonder_points
      t.integer :blue_points
      t.integer :yellow_points
      t.integer :black_points
      t.integer :purple_points
      t.integer :tablet_science_symbols
      t.integer :cog_science_symbols
      t.integer :compass_science_symbols
      t.integer :wildcard_science_symbols
      t.integer :leader_points
      t.integer :fleet_points
      t.integer :great_project_token_points
      t.integer :great_project_penalty_points
      t.integer :babel_tiles_played

      t.timestamps

      t.index :game_id
      t.index :user_id
    end
  end
end
