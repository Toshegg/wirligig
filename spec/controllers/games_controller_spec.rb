require 'rails_helper'

RSpec.describe Api::Rest::GamesController, type: :controller do

  let(:valid_attributes) {
    {
      name: "Monopoly",
      players_number: 7
    }
  }

  let(:invalid_attributes) {
    {
      someting: "bad"
    }
  }


  describe "GET #index" do
    it "assigns all games as @games" do
      game = Api::Rest::Game.create! valid_attributes
      get :index, {format: :json}
      expect(assigns(:games)).to eq([game])
    end
  end

  describe "GET #show" do
    it "assigns the requested game as @game" do
      game = Api::Rest::Game.create! valid_attributes
      get :show, {:id => game.to_param, format: :json}
      expect(assigns(:game)).to eq(game)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Api::Rest::Game" do
        expect {
          post :create, {:game => valid_attributes, format: :json}
        }.to change(Api::Rest::Game, :count).by(1)
      end

      it "assigns a newly created game as @game" do
        post :create, {:game => valid_attributes, format: :json}
        expect(assigns(:game)).to be_a(Api::Rest::Game)
        expect(assigns(:game)).to be_persisted
      end

      it "returns status 200" do
        post :create, {:game => valid_attributes, format: :json}
        expect(response.status).to eq 200
      end
    end

    context "with invalid params" do
     
      it "assigns a newly created but unsaved game as @game" do
        post :create, {:game => invalid_attributes, format: :json}
        expect(assigns(:game)).to be_a_new(Api::Rest::Game)
      end

      it "returns unprocessable entity" do
        post :create, {:game => invalid_attributes, format: :json}
        expect(response.status).to eq 422
      end
    end
  end

  describe "PUT #update" do
    let(:new_attributes) {
      {
        name: "Munchkin"
      } 
    }

    it "updates the requested game" do
      game = Api::Rest::Game.create! valid_attributes
      put :update, {:id => game.to_param, :game => new_attributes, format: :json}
      game.reload
      expect(game.name).to eq "Munchkin"
    end

    it "assigns the requested game as @game" do
      game = Api::Rest::Game.create! valid_attributes
      put :update, {:id => game.to_param, :game => valid_attributes, format: :json}
      expect(assigns(:game)).to eq(game)
    end

    it "returns status 200" do
      game = Api::Rest::Game.create! valid_attributes
      put :update, {:id => game.to_param, :game => valid_attributes, format: :json}
      expect(response.status).to eq 200
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested game" do
      game = Api::Rest::Game.create! valid_attributes
      expect {
        delete :destroy, {:id => game.to_param}
      }.to change(Api::Rest::Game, :count).by(-1)
    end

    it "returns status 204" do
      game = Api::Rest::Game.create! valid_attributes
      delete :destroy, {:id => game.to_param}
      expect(response.status).to eq 204
    end
  end

end
