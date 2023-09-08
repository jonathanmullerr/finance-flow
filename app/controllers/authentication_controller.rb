class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login
  before_action :set_user, only: :login

  # POST /auth/login
  def login
    user_info = @user.generate_token(params[:password])
    render json: user_info, status: user_info[:error] ? :unauthorized : :ok
  end

  private

  def set_user
    @user = User.find_by_email(params[:email])
  end

  def login_params
    params.permit(:email, :password)
  end
end
