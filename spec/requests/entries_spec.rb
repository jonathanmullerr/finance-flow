require 'rails_helper'

RSpec.describe EntriesController, type: :controller do
  let(:user) { create(:user) }
  let(:token) { Authentication::JWTService.encode(user_id: user.id) }

  before(:each) do
    request.headers['Authorization'] = "Bearer #{token}"
    @entry1 = create(:entry_one, user: user)
    @entry2 = create(:entry_two, user: user)
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
      expect(parsed_body.first["id"]).to eq @entry1.id
      expect(parsed_body.second["id"]).to eq @entry2.id
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: @entry1.id }
      expect(response).to be_successful
    end

    it "returns the correct entry as JSON" do
      get :show, params: { id: @entry1.id }
      parsed_body = JSON.parse(response.body)

      expect(parsed_body["id"]).to eq @entry1.id
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new entry' do
        expect do
          post :create, params: { amount: 10.00, type: "Expense" }
        end.to change(Entry, :count).by(1)
      end

      it 'renders the created entry as JSON' do
        post :create, params: {  amount: 10.00, type: "Expense" }
        expect(response.body).to eq(EntrySerializer.new(Entry.last).to_json)
      end

      it 'returns a 201 (Created) status code' do
        post :create, params: { amount: 200, type: "Expense" }
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      it 'returns a 422 (Unprocessable Entity) status code' do
        post :create, params: { amount: nil }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT #update" do
    context "when the entry is updated successfully" do
      it "renders the updated entry as json" do
        new_attributes = { date: Date.new(2022, 10, 10), type: "Expense", amount: 100.0, description: "Trip to Hawaii", id: @entry1.id }
        put :update, params: new_attributes

        expect(response).to have_http_status(:ok)
        expect(response.body).to eq(EntrySerializer.new(@entry1.reload).to_json)
      end
    end

    context "when the entry fails to update" do
      it "renders the errors as json" do
        new_attributes_to_update = { date: '', type: '', amount: '', description: '', id: @entry1.id }
        put :update, params: new_attributes_to_update

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    context "when the entry is destroyed successfully" do
      it "destroys the entry" do
        delete :destroy, params: { id: @entry1.id }

        expect { @entry1.reload }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  after(:each) do
    Entry.destroy_all
  end
end
