require 'rails_helper'

RSpec.describe EntriesController, type: :controller do
  before(:each) do
    @incoming1 = create(:incoming)
    @incoming2 = create(:incoming)
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end

    it "returns all incomings as JSON" do
      get :index
      parsed_body = JSON.parse(response.body)

      expect(parsed_body.length).to eq 2
      expect(parsed_body.first["id"]).to eq @incoming1.id
      expect(parsed_body.second["id"]).to eq @incoming2.id
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: @incoming1.id }
      expect(response).to be_successful
    end

    it "returns the correct incoming as JSON" do
      get :show, params: { id: @incoming1.id }
      parsed_body = JSON.parse(response.body)

      expect(parsed_body["id"]).to eq @incoming1.id
    end
  end

  after(:each) do
    Incoming.destroy_all
  end
end
