class SolutionsController < ApplicationController
  before_action :best_game_score, only: [:index]

  def index
    @party = Party.find(params[:party_id])
    @game = Game.find(params[:game_id])
  end
end
