require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  before { allow(controller).to receive(:authorize_request).and_return(true) }

  before(:each) do
    @user = create(:user)

    @category1 = create(:category, user: @user)
    @category2 = create(:category, user: @user)
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end

    it "returns all categories as JSON" do
      get :index
      parsed_body = JSON.parse(response.body)

      expect(parsed_body.length).to eq 2
      expect(parsed_body.first["id"]).to eq @category1.id
      expect(parsed_body.second["id"]).to eq @category2.id
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: @category1.id }
      expect(response).to be_successful
    end

    it "returns the correct category as JSON" do
      get :show, params: { id: @category1.id }
      parsed_body = JSON.parse(response.body)

      expect(parsed_body["id"]).to eq @category1.id
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new category' do
        expect do
          post :create, params: { categories: { name: "Test", user_id: @user.id } }
        end.to change(Category, :count).by(1)
      end

      it 'renders the created category as JSON' do
        post :create, params: { categories: { name: "Test", user_id: @user.id } }
        expect(response.body).to eq(CategorySerializer.new(Category.last).to_json)
      end

      it 'returns a 201 (Created) status code' do
        post :create, params: { categories: { name: "Test", user_id: @user.id } }
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      it 'returns a 422 (Unprocessable Entity) status code' do
        post :create, params: { categories: { name: nil } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT #update" do
    context "when the entry is updated successfully" do
      it "renders the updated entry as json" do
        new_attributes = { name: "Test", description: "", image: "" }
        put :update, params: { id: @category1.id, categories: new_attributes }

        expect(response).to have_http_status(:ok)
        expect(response.body).to eq(CategorySerializer.new(@category1.reload).to_json)
      end
    end

    context "when the entry fails to update" do
      it "renders the errors as json" do
        new_attributes_to_update = { name: "", description: "", image: "" }
        put :update, params: { id: @category1.id, categories: new_attributes_to_update }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    context "when the entry is destroyed successfully" do
      it "destroys the entry" do
        delete :destroy, params: { id: @category1.id }

        expect { @category1.reload }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  after(:each) do
    Category.destroy_all
  end
end
