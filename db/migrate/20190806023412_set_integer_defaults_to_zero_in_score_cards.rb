class SetIntegerDefaultsToZeroInScoreCards < ActiveRecord::Migration[5.2]
  def change
    change_column_default :score_cards, :plus_one_victory_tokens, 0
    change_column_default :score_cards, :plus_three_victory_tokens, 0
    change_column_default :score_cards, :plus_five_victory_tokens, 0
    change_column_default :score_cards, :plus_seven_victory_tokens, 0
    change_column_default :score_cards, :minus_one_defeat_tokens, 0
    change_column_default :score_cards, :minus_two_defeat_tokens, 0
    change_column_default :score_cards, :minus_three_defeat_tokens, 0
    change_column_default :score_cards, :coin_total, 0
    change_column_default :score_cards, :debt_total, 0
    change_column_default :score_cards, :wonder_points, 0
    change_column_default :score_cards, :blue_points, 0
    change_column_default :score_cards, :yellow_points, 0
    change_column_default :score_cards, :black_points, 0
    change_column_default :score_cards, :purple_points, 0
    change_column_default :score_cards, :tablet_science_symbols, 0
    change_column_default :score_cards, :cog_science_symbols, 0
    change_column_default :score_cards, :compass_science_symbols, 0
    change_column_default :score_cards, :wildcard_science_symbols, 0
    change_column_default :score_cards, :leader_points, 0
    change_column_default :score_cards, :fleet_points, 0
    change_column_default :score_cards, :great_project_token_points, 0
    change_column_default :score_cards, :great_project_penalty_points, 0
    change_column_default :score_cards, :babel_tiles_played, 0
  end
end
