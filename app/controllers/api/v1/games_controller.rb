class Api::V1::GamesController < ApplicationController
    
    def index
        @games = Game.all
        render json: @games
    end
    
    def create
        @game = Game.new()
        @game.save
        render json: @game
    end

    def destroy 
        @game = Game.find(params[:id])
        User.end_game(@game.id)
        @game.destroy
        render json: @game
    end
end
