require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  before(:each) do
    @transaction1 = create(:transaction_one)
    @transaction2 = create(:transaction_two)
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end

    it "returns all transactions as JSON" do
      get :index
      parsed_body = JSON.parse(response.body)

      expect(parsed_body.length).to eq 2
      expect(parsed_body.first["id"]).to eq @transaction1.id
      expect(parsed_body.second["id"]).to eq @transaction2.id
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: @transaction1.id }
      expect(response).to be_successful
    end

    it "returns the correct transaction as JSON" do
      get :show, params: { id: @transaction1.id }
      parsed_body = JSON.parse(response.body)

      expect(parsed_body["id"]).to eq @transaction1.id
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new transaction' do
        expect do
          post :create, params: { transactions: { amount: 10.00 } }
        end.to change(Transaction, :count).by(1)
      end

      it 'renders the created transaction as JSON' do
        post :create, params: { transactions: { amount: 10.00 } }
        expect(response.body).to eq(TransactionSerializer.new(Transaction.last).to_json)
      end

      it 'returns a 201 (Created) status code' do
        post :create, params: { transactions: { amount: 200 } }
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      it 'returns a 422 (Unprocessable Entity) status code' do
        post :create, params: { transactions: { amount: nil } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT #update" do
    context "when the transaction is updated successfully" do
      it "renders the updated transaction as json" do
        new_attributes = { date: Date.new(2022, 10, 10), amount: 100.0, description: "Trip to Hawaii" }
        put :update, params: { id: @transaction1.id, transactions: new_attributes }

        expect(response).to have_http_status(:ok)
        expect(response.body).to eq(TransactionSerializer.new(@transaction1.reload).to_json)
      end
    end

    context "when the transaction fails to update" do
      it "renders the errors as json" do
        new_attributes_to_update = { date: '', type: '', amount: '', description: '' }
        put :update, params: { id: @transaction1.id, transactions: new_attributes_to_update }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    context "when the transaction is destroyed successfully" do
      it "destroys the transaction" do
        delete :destroy, params: { id: @transaction1.id }

        expect { @transaction1.reload }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  after(:each) do
    Transaction.destroy_all
  end
end
