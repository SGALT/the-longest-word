class PartiesController < ApplicationController
  def edit
    @party = Party.find(params[:id])
  end

  def update
    @party = Party.find(params[:id])
    @game = @party.game
    @try = params[:party][:word]
    if word_valid?(@try, @party.ten_letters_list) && word_exists?(@try)
      @party.party_score = @try.size
      @party.update(party_params)
      redirect_to game_path(@game), notice: "Great, you just gained #{@try.size} points"
    else
      redirect_to edit_game_party_path(@game, @party), notice: 'Not Great'
    end
  end

  private

  def party_params
    params.require(:party).permit(:word)
  end

  def word_valid?(word, ten_letters_list)
    word.chars.all? { |letter| word.count(letter) <= ten_letters_list.count(letter) }
  end

  def word_exists?(word)
    Word.exists?(item: word)
  end
end
