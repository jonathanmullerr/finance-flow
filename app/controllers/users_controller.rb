class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

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
    render json: @user, status: :ok if @user.update!(user_params)
  end

  # DELETE /users/{id}
  def destroy
    render json: { message: 'User deleted successfully' }, status: :ok if @user.destroy
  end

  private

  def find_user
    @user = User.find(@current_user.id)
  end

  def user_params
    params.permit(:name, :username, :email, :password, :password_confirmation)
  end

  # Exceptions
  def record_not_found
    render json: { errors: 'User not found' }, status: :not_found
  end

  def record_invalid(exception)
    render json: { errors: exception.message }, status: :unprocessable_entity
  end
end
