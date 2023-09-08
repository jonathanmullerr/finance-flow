require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do
  let(:user) { create(:user) }
  let(:token) { Authentication::JWTService.encode(user_id: user.id) }

  before(:each) do
    request.headers['Authorization'] = "Bearer #{token}"
    @expense1 = create(:expense, user: user)
    @expense2 = create(:expense, user: user)
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end

    it "returns all entries as JSON" do
      get :index
      parsed_body = JSON.parse(response.body)

      expect(parsed_body.length).to eq 2
      expect(parsed_body.first["id"]).to eq @expense1.id
      expect(parsed_body.second["id"]).to eq @expense2.id
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: @expense1.id }
      expect(response).to be_successful
    end

    it "returns the correct expense as JSON" do
      get :show, params: { id: @expense1.id }
      parsed_body = JSON.parse(response.body)

      expect(parsed_body["id"]).to eq @expense1.id
    end
  end

  after(:each) do
    Expense.destroy_all
  end
end
