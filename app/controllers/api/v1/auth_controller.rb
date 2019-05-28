class Api::V1::AuthController < ApplicationController
    # skip_before_action :authorized, only: [:create]
  
    # login
    def create
      @user = User.find_or_create_by(name: params[:name])
      if @user
        # encode token comes from ApplicationController
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