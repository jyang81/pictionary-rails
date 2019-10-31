class Api::V1::WordsController < ApplicationController
  skip_before_action :authorized

  def index
    @words = Word.all
    render json: @words
  end
end
