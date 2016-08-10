require 'rails_helper'

RSpec.describe "Meetings", type: :request do
  describe "GET api/rest/meetings" do
    context 'without filters' do
      let(:meetings_count) { 20 }

      before do 
        meetings_count.times do
          create :meeting
        end
      end

      before { get '/api/rest/meetings', nil, {'HTTP_ACCEPT' => Mime::JSON} }
     
      it_behaves_like 'success API response'

      it "should have 20 items" do
        meetings = JSON.parse(response.body)

        expect(meetings['meetings'].length).to eq meetings_count
      end
    end

    context 'with filters' do
      let(:filter_params) {
        {
          distance: (rand * 10).to_i,
          lat: rand * 100,
          lng: rand * 100,
          name: Faker::Lorem.characters(10),
          hour_from: 2,
          hour_to: 22,
          weekday: 5,
          games_ids: [1,2,3]
        }
      }
      let(:meetings_count) { 20 }

      before do 
        meetings_count.times do
          create :meeting
        end
      end

      before { get '/api/rest/meetings', filter_params, {'HTTP_ACCEPT' => Mime::JSON} }
     
      it_behaves_like 'success API response'
    end

  end

  describe "GET api/rest/meetings/:id" do

    let(:meeting) {
      create :meeting
    }

    before { get "/api/rest/meetings/#{meeting.id}", nil, {'HTTP_ACCEPT' => Mime::JSON} }
   
    it_behaves_like 'success API response'

  end

  describe "POST api/rest/meetings" do

    context 'valid meeting' do
      let(:game) { create :game }
      let(:params) {
        { 
          meeting: {
            name: Faker::Lorem.characters(20),
            starts_at: DateTime.now,
            ends_at: DateTime.now + 2.days,
            lat: rand * 100,
            lng: rand * 100,
            games_ids: [game.id]
          }
        } 
      }

      before { post '/api/rest/meetings', params, {'HTTP_ACCEPT' => Mime::JSON} }
     
      it_behaves_like 'success API response'
    end

    context 'not valid meeting' do

      let(:params) {
        { 
          meeting: {
            name: Faker::Lorem.characters(20),
            ends_at: DateTime.now + 2.days,
            lat: rand * 100,
            lng: rand * 100
          }
        } 
      }

      before { post '/api/rest/meetings', params, {'HTTP_ACCEPT' => Mime::JSON} }
     
      it 'returns error' do
        expect(response.status).to eq 422

        meeting = JSON.parse(response.body)
        
        expect(meeting["errors"]["starts_at"]).to eq ["can't be blank"]
      end

    end

  end

  describe "PUT api/rest/meetings/:id" do

    let (:game) { create :game }

    let(:params) {
      { 
        meeting: {
          name: Faker::Lorem.characters(20),
          starts_at: DateTime.now,
          ends_at: DateTime.now + 2.days,
          lat: rand * 100,
          lng: rand * 100,
          games_ids: [game.id]
        }
      } 
    }

    let(:meeting) {
      create :meeting
    }

    before { put "/api/rest/meetings/#{meeting.id}", params, {'HTTP_ACCEPT' => Mime::JSON} }
   
    it_behaves_like 'success API response'

  end

  describe "DELETE api/rest/meetings/:id" do

    let(:meeting) {
      create :meeting
    }

    before { delete "/api/rest/meetings/#{meeting.id}" }
   
    it_behaves_like 'success DELETE response'

  end

end
