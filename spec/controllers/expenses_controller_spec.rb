require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do
  before(:each) do 
    @expense1 = create(:expense_one)
    @expense2 = create(:expense_two)
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end

    it "returns all expenses as JSON" do
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

  describe ExpensesController do
    describe 'POST #create' do
      context 'with valid params' do
        it 'creates a new expense' do
          expect { post :create, params: { expense: {amount: 10.00} } 
          }.to change(Expense, :count).by(1)
        end
  
        it 'renders the created expense as JSON' do
          post :create, params: { expense: { amount: 10.00} }
          expect(response.body).to eq( ExpenseSerializer.new(Expense.last).to_json)
        end
  
        it 'returns a 201 (Created) status code' do
          post :create, params: { expense: {amount: 200} }
          expect(response).to have_http_status(:created)
        end
      end
  
      context 'with invalid params' do
        it 'returns a 422 (Unprocessable Entity) status code' do
          post :create, params: { expense: { amount: nil } }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end
  

  describe "PUT #update" do
    context "when the expense is updated successfully" do
      it "renders the updated expense as json" do
        new_attributes = { date: Date.new(2022, 10, 10), amount: 100.0, description: "Trip to Hawaii" }
        put :update, params: { id: @expense1.id, expense: new_attributes } 
        
        expect(response).to have_http_status(:ok)
        expect(response.body).to eq( ExpenseSerializer.new(@expense1.reload).to_json )
      end
    end

    context "when the expense fails to update" do
      it "renders the errors as json" do
        new_attributes_to_update = { date: '', type: '', amount: '', description: '' }
        put :update, params: {id: @expense1.id, expense: new_attributes_to_update }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  require 'rails_helper'

  describe "DELETE #destroy" do
    context "when the expense is destroyed successfully" do
      it "destroys the expense" do
        delete :destroy, params: { id: @expense1.id }

        expect { @expense1.reload }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end


  
  after(:each) do
    Expense.destroy_all
  end
end
