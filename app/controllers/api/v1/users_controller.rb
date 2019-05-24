class Api::V1::UsersController < ApplicationController
    def index
        @users = User.all
       render json: @users
    end

    def create 
        @user = User.new(user_params)
        @user.save
        render json: @user
    end

    def update 
        @user = user.find(params[:id])
        @user.update(user_params)
        @user = user.find(params[:id])
        render json: @user
    end


    private

    def user_params 
        params.require(:user).permit(:name, :games_won, game_id)
    end
end
