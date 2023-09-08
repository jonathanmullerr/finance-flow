class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :jwt_unauthorized
  rescue_from JWT::DecodeError, with: :jwt_unauthorized

  def not_found
    render json: { error: 'not_found' }, status: :not_found
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    @decoded = Authentication::JWTService.decode(header)
    @current_user = User.find(@decoded[:user_id])
  end

  private

  def jwt_unauthorized(error)
    render json: { errors: error.message }, status: :unauthorized
  end
end
