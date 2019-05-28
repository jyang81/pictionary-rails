# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Game.destroy_all
Word.destroy_all

User.create(name: "Joe", games_won: 0, game_id: 1)
User.create(name: "Jon", games_won: 0, game_id: 1)

Game.create

Word.create(word: "whale")
Word.create(word: "water bottle")
Word.create(word: "whiteboard")
Word.create(word: "campfire")
Word.create(word: "keyboard")
Word.create(word: "react")
Word.create(word: "IPA")
Word.create(word: "train")
Word.create(word: "battery")
Word.create(word: "ice cube")
