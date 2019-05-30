class Game < ApplicationRecord
    has_many :users

    def self.checkForWinner(guess) 
        if self.first.word.downcase == guess["content"].downcase && self.first.drawer_name != guess['user_name']
            winning_guesser = User.find(guess['user_id'])
            guesser_games_won = winning_guesser.games_won.to_i + 1
            winning_guesser.update(games_won: guesser_games_won)

            winning_drawer = User.find(self.first.drawer_id)
            drawer_games_won = winning_drawer.games_won.to_i + 1
            winning_drawer.update(games_won: drawer_games_won)
            
            ChatMessage.create(
                content: "Attention please, #{winning_guesser.name} guessed correctly with #{guess['content']}",
                user_id: 1,
                user_name:'EvilHost')
        end 
    end
end


# Winner: #{guess['user_name']} guessed #{guess['content']}