class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create

  end

  def destroy
  end
end
