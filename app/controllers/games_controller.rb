class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = current_user.games.create(game_params)

    if @game.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private #>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  
  def game_params
    params.require(:game).permit(:number_of_players,
      :leaders_expansion,
      :cities_expansion,
      :armada_expansion,
      :great_projects_expansion,
      :babel_expansion
    )
  end
end
