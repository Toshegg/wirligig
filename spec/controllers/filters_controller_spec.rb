require 'rails_helper'

RSpec.describe Api::Rest::FiltersController, type: :controller do

  let(:user) { create :user }
  let(:valid_attributes) {
    {
      value: "{\"name\": \"sec\"}",
      user_id: user.id
    }
  }

  let(:invalid_attributes) {
    {
      someting: "bad"
    }
  }


  describe "GET #index" do
    it "assigns all filters as @filters" do
      filter = Api::Rest::Filter.create! valid_attributes
      get :index, {format: :json}
      expect(assigns(:filters)).to eq([filter])
    end
  end

  describe "GET #show" do
    it "assigns the requested filter as @filter" do
      filter = Api::Rest::Filter.create! valid_attributes
      get :show, {:id => filter.to_param, format: :json}
      expect(assigns(:filter)).to eq(filter)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Api::Rest::Filter" do
        expect {
          post :create, {:filter => valid_attributes, format: :json}
        }.to change(Api::Rest::Filter, :count).by(1)
      end

      it "assigns a newly created filter as @filter" do
        post :create, {:filter => valid_attributes, format: :json}
        expect(assigns(:filter)).to be_a(Api::Rest::Filter)
        expect(assigns(:filter)).to be_persisted
      end

      it "returns status 200" do
        post :create, {:filter => valid_attributes, format: :json}
        expect(response.status).to eq 200
      end
    end

    context "with invalid params" do
     
      before do
        user
      end
      
      it "assigns a newly created but unsaved filter as @filter" do
        post :create, {:filter => invalid_attributes, format: :json}
        expect(assigns(:filter)).to be_a_new(Api::Rest::Filter)
      end

      it "returns unprocessable entity" do
        post :create, {:filter => invalid_attributes, format: :json}
        expect(response.status).to eq 422
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          value: "{\"name\": \"second\"}"
        } 
      }

      it "updates the requested filter" do
        filter = Api::Rest::Filter.create! valid_attributes
        put :update, {:id => filter.to_param, :filter => new_attributes, format: :json}
        filter.reload
        expect(filter.value).to eq({"name"=>"second"})
      end

      it "assigns the requested filter as @filter" do
        filter = Api::Rest::Filter.create! valid_attributes
        put :update, {:id => filter.to_param, :filter => valid_attributes, format: :json}
        expect(assigns(:filter)).to eq(filter)
      end

      it "returns status 200" do
        filter = Api::Rest::Filter.create! valid_attributes
        put :update, {:id => filter.to_param, :filter => valid_attributes, format: :json}
        expect(response.status).to eq 200
      end
    end

    context "with invalid params" do
      let(:new_invalid_attributes) {
        {
          value: "something"
        } 
      }

      it "assigns the filter as @filter" do
        filter = Api::Rest::Filter.create! valid_attributes
        put :update, {:id => filter.to_param, :filter => new_invalid_attributes, format: :json}
        expect(assigns(:filter)).to eq(filter)
      end

      it "returns unprocessable entity" do
        filter = Api::Rest::Filter.create! valid_attributes
        put :update, {:id => filter.to_param, :filter => new_invalid_attributes, format: :json}
        expect(response.status).to eq 422
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested filter" do
      filter = Api::Rest::Filter.create! valid_attributes
      expect {
        delete :destroy, {:id => filter.to_param}
      }.to change(Api::Rest::Filter, :count).by(-1)
    end

    it "returns status 204" do
      filter = Api::Rest::Filter.create! valid_attributes
      delete :destroy, {:id => filter.to_param}
      expect(response.status).to eq 204
    end
  end

end
