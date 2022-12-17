class UsersController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_user, except: [:create, :index]

  def index
    @users = User.find(@current_user.id)
    render json: @users, status: :ok
  end

  # GET /users/{id}
  def show
    render json: @user, status: :ok
  end

  # POST /users
  # Params: name, username, email, password, password_confirmation
  # Require: username, email, password, password_confirmation
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PUT /users/{id}
  def update
    @user.update!(user_params)

    render json: @user, status: :ok
  rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.message }, status: :unprocessable_entity
  end

  # DELETE /users/{id}
  def destroy
    @user.destroy

    render json: { message: 'User deleted successfully' }, status: :ok
  end

  private

  def find_user
    @user = User.find(@current_user.id)
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    params.permit(:name, :username, :email, :password, :password_confirmation)
  end
end
