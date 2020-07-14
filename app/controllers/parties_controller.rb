class PartiesController < ApplicationController
  def edit
    @party = Party.find(params[:id])
  end

  def update
    @party = Party.find(params[:id])
    @game = @party.game
    @party.update(party_params)
    redirect_to edit_game_party_path(@game, @party)
  end

  private

  def party_params
    params.require(:party).permit(:word)
  end
end
