class GamesController < ApplicationController
  def index
    @games = current_user.games
    @game = Game.new
  end

  def show
    @game = Game.find(params[:id])
  end

  def create
    @game = Game.new
    @game.user_id = current_user.id
    if @game.save
      redirect_to root_path
    else
      render :index
    end
  end
end
