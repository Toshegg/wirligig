require 'rails_helper'

RSpec.describe Api::Rest::MeetingsController, type: :controller do

  let(:valid_attributes) {
    {
      name: Faker::Lorem.characters(20),
      starts_at: DateTime.now,
      lat: rand * 100,
      lng: rand * 100
    }
  }

  let(:invalid_attributes) {
    {
      starts_at: DateTime.now,
      lat: rand * 100,
      lng: rand * 100
    } 
  }

  describe "GET #index" do
    it "assigns all meetings as @meetings" do
      meeting = Api::Rest::Meeting.create! valid_attributes
      get :index, format: :json
      expect(assigns(:meetings)).to eq([meeting])
    end
  end

  describe "GET #show" do
    it "assigns the requested meeting as @meeting" do
      meeting = Api::Rest::Meeting.create! valid_attributes
      get :show, {:id => meeting.to_param, format: :json}
      expect(assigns(:meeting)).to eq(meeting)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Api::Rest::Meeting" do
        expect {
          post :create, {:meeting => valid_attributes, format: :json}
        }.to change(Api::Rest::Meeting, :count).by(1)
      end

      it "assigns a newly created meeting as @meeting" do
        post :create, {:meeting => valid_attributes, format: :json}
        expect(assigns(:meeting)).to be_a(Api::Rest::Meeting)
        expect(assigns(:meeting)).to be_persisted
      end

      it "returns status 200" do
        post :create, {:meeting => valid_attributes, format: :json}
        expect(response.status).to eq 200
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved meeting as @meeting" do
        post :create, {:meeting => invalid_attributes, format: :json}
        expect(assigns(:meeting)).to be_a_new(Api::Rest::Meeting)
      end

      it "returns unprocessable entity" do
        post :create, {:meeting => invalid_attributes, format: :json}
        expect(response.status).to eq 422
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          name: Faker::Lorem.characters(20)
        }
      }
     
      it "updates the requested meeting" do
        meeting = Api::Rest::Meeting.create! valid_attributes
        put :update, {:id => meeting.to_param, :meeting => new_attributes, format: :json}
        meeting.reload
        expect(meeting.name).to eq(new_attributes[:name])
      end

      it "assigns the requested meeting as @meeting" do
        meeting = Api::Rest::Meeting.create! valid_attributes
        put :update, {:id => meeting.to_param, :meeting => valid_attributes, format: :json}
        expect(assigns(:meeting)).to eq(meeting)
      end

      it "returns status 200" do
        meeting = Api::Rest::Meeting.create! valid_attributes
        put :update, {:id => meeting.to_param, :meeting => valid_attributes, format: :json}
        expect(response.status).to eq 200
      end

    end

    context "with invalid params" do 
      let(:new_invalid_attributes) {
        {
          starts_at: "example"
        }
      }

      it "assigns the meeting as @meeting" do
        meeting = Api::Rest::Meeting.create! valid_attributes
        put :update, {:id => meeting.to_param, :meeting => new_invalid_attributes, format: :json}
        expect(assigns(:meeting)).to eq(meeting)
      end

      it "returns unprocessable entity" do
        meeting = Api::Rest::Meeting.create! valid_attributes
        put :update, {:id => meeting.to_param, :meeting => new_invalid_attributes, format: :json}
        expect(response.status).to eq 422
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested meeting" do
      meeting = Api::Rest::Meeting.create! valid_attributes
      expect {
        delete :destroy, {:id => meeting.to_param}
      }.to change(Api::Rest::Meeting, :count).by(-1)
    end

    it "returns status 204" do
      meeting = Api::Rest::Meeting.create! valid_attributes
      delete :destroy, {:id => meeting.to_param}
      expect(response.status).to eq 204
    end
  end

end
