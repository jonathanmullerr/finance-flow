# frozen_string_literal: true

module Authentication
  class TokenService
    TOKEN_EXPIRATION_TIME = 24.hours.to_i

    def initialize(user)
      @user = user
    end

    def generate_token(password)
      return { error: 'unauthorized' } unless @user.authenticate(password)

      { token: generate_auth_token, exp: token_expiration_time, username: @user.username }
    end

    private

    def generate_auth_token
      Authentication::JwtService.encode(user_id: @user.id)
    end

    def token_expiration_time
      Time.now + TOKEN_EXPIRATION_TIME
    end
  end
end
