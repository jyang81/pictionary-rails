class Api::V1::AuthController < ApplicationController
    # skip_before_action :authorized, only: [:create]
  
    # login
    def create
      username = params[:name].downcase
      @user = User.find_by(name: username)
      if !@user 
        User.create(name: username)
      end
      if @user
        # encode token comes from ApplicationController
        if Game.all.length > 0
          game_command = GameManager.new # refactor this to live in Game class
          game_command.command = "updatedGameState"
          game_command.payload = ["Started"]
          GameManagerCreationEventBroadcastJob.perform_now(game_command)
        end
        token = encode_token({ user_id: @user.id })
        render json: { user: @user, jwt: token }, status: :accepted
      else
        render json: { message: 'Invalid username' }, status: :unauthorized
      end
    end
  
    private
  
    def user_login_params
      params.require(:user).permit(:name)
    end
  end