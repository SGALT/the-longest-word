class GamesController < ApplicationController
  def index
    @games = current_user.games
    @game = Game.new
  end

  def show
    @game = Game.find(params[:id])
    @parties = @game.parties
    @total_score = @parties.pluck("sum(party_score)")[0]
  end

  def create
    @game = Game.new
    @game.user_id = current_user.id
    if @game.save
      redirect_to root_path, notice: "Jeu créé ! A vous de jouer !"
    else
      redirect_to root_path, notice: "Il y a eu une erreur, veuillez essayer à nouveau"
    end
  end
end
