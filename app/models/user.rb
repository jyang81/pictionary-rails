class User < ApplicationRecord
    has_one :game
    has_many :chat_messages

    def self.end_game(game_id) 
        self.all.each do |user|
            if user.game_id.to_i == game_id
                user.update(game_id:nil)
            end
        end
    end 
end
