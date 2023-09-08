class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from JWT::DecodeError, with: :jwt_decode_error

  def not_found
    render json: { error: 'not_found' }, status: :not_found
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    @decoded = Authentication::JsonWebTokenService.decode(header)
    @current_user = User.find(@decoded[:user_id])
  end

  private

  def record_not_found(e)
    render json: { errors: e.message }, status: :unauthorized
  end

  def jwt_decode_error(e)
    render json: { errors: e.message }, status: :unauthorized
  end
end
