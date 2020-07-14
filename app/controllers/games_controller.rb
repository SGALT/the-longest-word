class GamesController < ApplicationController
  def index
    @games = current_user.games
    @game = Game.new
  end

  def show
    @game = Game.find(params[:id])
    @parties = @game.parties
  end

  def create
    @game = Game.new
    @game.user_id = current_user.id
    @game.parties.build(ten_letters_list: ('a'..'z').to_a.sample(10).join(''), word: 'word' )
    if @game.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
end
