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
    5.times do
      @game.parties.build(ten_letters_list: ten_letters_list, word: 'find a word' )
    end
    if @game.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def ten_letters_list
    @vowel = ['a', 'e', 'i', 'o', 'u', 'y']
    @consonant = ('a'..'z').to_a - @vowel
    result = []
    5.times do
      result << @vowel.sample
      result << @consonant.sample
    end
    result.shuffle.join('')
  end
end
