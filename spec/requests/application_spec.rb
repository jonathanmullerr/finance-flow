require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  # describe '#not_found' do
  #   it 'renders a not_found error in JSON format' do
  #     get 
  #     expect(response.body).to eq({ error: 'not_found' }.to_json)
  #     expect(response).to have_http_status(:not_found)
  #   end
  # end

  # describe '#authorize_request' do
  #   let(:user) { create(:user) }
  #   let(:token) { JsonWebToken.encode(user_id: user.id) }

  #   context 'when the request has a valid JWT token in the Authorization header' do
  #     it 'sets the current_user based on the user_id in the token' do
  #       request.headers['Authorization'] = "Bearer #{token}"
  #       get :authorize_request
  #       expect(assigns(:current_user)).to eq(user)
  #     end
  #   end

  #   context 'when the request does not have a valid JWT token in the Authorization header' do
  #     it 'returns an unauthorized error' do
  #       request.headers['Authorization'] = 'Bearer invalid_token'
  #       get :authorize_request
  #       expect(response.body).to eq({ errors: 'JWT::DecodeError' }.to_json)
  #       expect(response).to have_http_status(:unauthorized)
  #     end
  #   end

  #   context 'when the user_id in the JWT token does not correspond to a user in the database' do
  #     it 'returns an unauthorized error' do
  #       request.headers['Authorization'] = 'Bearer invalid_token'
  #       get :authorize_request
  #       expect(response.body).to eq({ errors: 'ActiveRecord::RecordNotFound' }.to_json)
  #       expect(response).to have_http_status(:unauthorized)
  #     end
  #   end
  # end
end
