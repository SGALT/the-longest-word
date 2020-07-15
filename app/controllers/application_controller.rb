class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def best_game_score
    if Game.any?
      @best_score = Game.order(:game_score).reverse.first.game_score
    else
      @best_score = 0
    end
  end
end
