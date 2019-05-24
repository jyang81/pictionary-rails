class Api::V1::GamesController < ApplicationController
    def create
        @game = Game.new()
        @game.save
        render json: @game
    end

    def destroy 
        @game = Game.find(params[:id])
        @game.destroy
        render json: @game
    end
end
