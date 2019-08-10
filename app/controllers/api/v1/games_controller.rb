class Api::V1::GamesController < ApplicationController

    def index
        @games = Game.all
        render json: @games
    end

    def create
        @game = Game.new()
        index = rand(Word.all.length)
        @game.word = Word.all[index].word
        @game.drawer_id = params['drawer_id']
        @game.drawer_name = params['drawer_name']
        @game.save
        GameManager.create(command: 'updatedGameState', payload: opts.fetch('command'))
        render json: @game
    end

    def destroy
        @game = Game.find(params[:id])
        User.end_game(@game.id)
        # @game.destroy
        Game.destroy_all
        Line.destroy_all
        ChatMessage.destroy_all
        render json: @game
    end
end
