class User < ApplicationRecord
    has_one :game

    def self.end_game(game_id) 
        self.all.each do |user|
            if user.game_id.to_i == game_id
                user.update(game_id:nil)
            end
        end
    end 
end
