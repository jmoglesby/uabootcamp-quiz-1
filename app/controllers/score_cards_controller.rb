class ScoreCardsController < ApplicationController
  before_action :authenticate_user!

  def new
    @score_card = ScoreCard.new
    @game = Game.find(params[:game_id])
  end

  def create
    @game = Game.find(params[:game_id])
    new_score_card = @game.score_cards.create(score_card_params.merge(user: current_user))
    if new_score_card.valid?
      new_score_card.update_attribute(:total_score, new_score_card.calculate_score)
      redirect_to game_path(@game)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private #>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  def score_card_params
    params.require(:score_card).permit(
      :wonder,
      :plus_one_victory_tokens,
      :plus_three_victory_tokens,
      :plus_five_victory_tokens,
      :plus_seven_victory_tokens,
      :minus_one_defeat_tokens,
      :minus_two_defeat_tokens,
      :minus_three_defeat_tokens,
      :coin_total,
      :debt_total,
      :wonder_points,
      :blue_points,
      :yellow_points,
      :black_points,
      :purple_points,
      :tablet_science_symbols,
      :cog_science_symbols,
      :compass_science_symbols,
      :wildcard_science_symbols,
      :leader_points,
      :fleet_points,
      :great_project_token_points,
      :great_project_penalty_points,
      :babel_tiles_played,
      :total_score
    )
  end
end
