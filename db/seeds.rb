# Games create and test with limits

# puts "Creating games"
# Game.create(user_id: 1)
# puts "Game created"
# # byebug
# puts "trying to creating five parties"
# 4.times do
#   Party.create(game_id: Game.first.id, ten_letters_list: ('a'..'z').to_a.sample(8).join(''), word: ('a'..'z').to_a.sample(8).join('') )
# end
# puts "5 parties were created"

# puts "now we are trying to create one more party, hoping taht it will fail"
# Party.create(game_id: Game.first.id, ten_letters_list: ('a'..'z').to_a.sample(8).join(''), word: ('a'..'z').to_a.sample(8).join('') )
# puts "If you see this message, too bad for you, go back to work your rails basics"

# ============================================
# Dictionnary load

# require 'json'

# file = File.open("SPECIFY THE FILE PATH")
# words = JSON.load(file)

# words["word"].each do |word|
#   Word.create(item: word)
# end
