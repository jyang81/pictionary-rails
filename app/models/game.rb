class Game < ApplicationRecord
    has_many :users

    def self.checkForWinner(guess) 
        if self.first.word.downcase == guess.content.downcase && self.first.drawer_name != guess.user_name
            self.incrementGuesserPoints(guess)
            self.incrementDrawerPoints()
            ChatMessage.create(
                content: "Attention please, #{guess.user_name} guessed correctly with #{guess.content}",
                user_id: 1,
                user_name:'Game Host')
                
            game_command = GameManager.new(command: 'updatedGameState', payload: ['End'])
            GameManagerCreationEventBroadcastJob.perform_now(game_command)
            Game.destroy_all
            Line.destroy_all
            ChatMessage.destroy_all
        end 
    end

    def self.incrementGuesserPoints(guess) 
        winning_guesser = User.find_by(name: guess.user_name)
        if winning_guesser
            guesser_games_won = winning_guesser.games_won.to_i + 1
            winning_guesser.update(games_won: guesser_games_won)
        end
    end 

    def self.incrementDrawerPoints()
        game = Game.first
        winning_drawer = User.find_by(name: game.drawer_name)
        if winning_drawer
            drawer_games_won = winning_drawer.games_won.to_i + 1
            winning_drawer.update(games_won: drawer_games_won)
        end
    end
end
