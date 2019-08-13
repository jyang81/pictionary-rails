class Api::V1::LinesController < ApplicationController
  skip_before_action :authorized

  def index
    @lines = Line.all
    render json: @lines
  end
end
