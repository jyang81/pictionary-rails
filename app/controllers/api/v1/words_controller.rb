class Api::V1::WordsController < ApplicationController

    def index
        index = rand(Word.all.length)
        @word = Word.all[index]
        render json: @word
    end 
end
