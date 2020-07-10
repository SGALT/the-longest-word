# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# puts "Testing parties limitation"
# Game.destroy_all

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
