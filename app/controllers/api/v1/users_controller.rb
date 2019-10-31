class Api::V1::UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users
    end

    def profile
        render json: { user: current_user }, status: :accepted
    end

    def create
        @user = User.new(user_params)
        @user.save
        render json: { user: UserSerializer.new(@user) }, status: :created
    end

    def update
        @user = User.find(params[:id])
        if params[:games_won] != nil
            @user.update(game_id: params[:game_id],games_won: params[:games_won])
        else
            @user.update(game_id: params[:game_id])
        end
        @user = User.find(params[:id])
        render json: @user
    end


    private

    def user_params
        params.require(:user).permit(:name, :games_won)
    end
end
