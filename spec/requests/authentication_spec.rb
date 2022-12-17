require 'rails_helper'

RSpec.describe AuthenticationController, type: :request do
  before(:each) do
    @user = create(:user)
  end

  describe 'POST /auth/login' do
    context 'with valid credentials' do
      it 'returns a JSON web token and the expiration date' do
        post '/auth/login', params: { email: @user.email, password: @user.password }

        expect(response).to have_http_status(:ok)
        json_response = JSON.parse(response.body)
        expect(json_response).to include('token', 'exp', 'username')
        expect(json_response['username']).to eq(@user.username)
      end
    end

    context 'with invalid credentials' do
      it 'returns an unauthorized error' do
        post '/auth/login', params: { email: @user.email, password: 'wrong_password' }

        expect(response).to have_http_status(:unauthorized)
        json_response = JSON.parse(response.body)
        expect(json_response).to include('error')
        expect(json_response['error']).to eq('unauthorized')
      end
    end
  end
end
