class ApplicationController < ActionController::API
  def information
    render json: { message: 'Welcome to the Finance-Flow API. Para acessar qualquer rota, é necessário fazer login em /auth/login para receber um token de autenticação' }
  end

  def not_found
    render json: { error: 'not_found' }, status: :not_found
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
      Thread.current[:user_id] = @current_user.id
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end
