class PartiesController < ApplicationController
  def show
    @party = Party.find(params[:id])
    @best_score = Game.order(:game_score).reverse.first.game_score
  end

  def new
    @party = Party.new
    @ten_letters_list = ten_letters_list!
  end

  def create
    @party = Party.new(party_params)
    @party.game_id = params[:game_id]
    if word_valid?(@party.word, @party.ten_letters_list) && word_exists?(@party.word)
      @party.party_score = @party.word.size
      @party.available = true
      @party.save
      solutions_build(@party)
      game_score_update(@party)
      redirect_to game_party_solutions_path(@party.game, @party.id), notice: "Bravo, vous venez de marquer #{@party.word.size} points"
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

  def solutions_build(party)
    solutions = []
    Word.all.each do |word|
      if word.item.chars.all? { |letter| word.item.count(letter) <= party.ten_letters_list.count(letter) }
        solutions << word
      end
    end
    solutions.sort! { |a,b| b.item.length <=> a.item.length }
    solutions.first(10).each { |solution| Solution.create(party_id: party.id, word: solution.item) }
  end

  def game_score_update(party)
    sum = party.game.parties.pluck("sum(party_score)").first
    party.game.update(game_score: sum)
  end
end
