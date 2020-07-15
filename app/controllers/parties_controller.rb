class PartiesController < ApplicationController
  def show
    @party = Party.find(params[:id])
  end

  def new
    @party = Party.new
    @ten_letters_list = ten_letters_list!
  end

  def create
    @party = Party.new(party_params)
    @party.game_id = params[:game_id]
    @party.available = true
    @try = params[:party][:word]
    if word_valid?(@try, @party.ten_letters_list) && word_exists?(@try)
      @party.party_score = @try.size
      @party.save
      redirect_to game_path(@party.game), notice: "Bravo, vous venez de marquer #{@try.size} points"
    else
      redirect_to new_game_party_path(@party.game), notice: "mot non existant ou vous n'utilisez pas les lettres proposées"
    end
  end

  private

  def party_params
    params.require(:party).permit(:word, :ten_letters_list, :game_id)
  end

  def ten_letters_list!
    @vowel = ['a', 'e', 'i', 'o', 'u', 'y']
    @consonant = ('a'..'z').to_a - @vowel
    result = []
    5.times do
      result << @vowel.sample
      result << @consonant.sample
    end
    result.shuffle.join('')
  end

  def word_valid?(word, ten_letters_list)
    word.chars.all? { |letter| word.count(letter) <= ten_letters_list.count(letter) }
  end

  def word_exists?(word)
    Word.exists?(item: word)
  end
end
