require 'rails_helper'

RSpec.describe "Games", type: :request do
   describe "GET api/rest/games" do
    let(:games_count) { 20 }

    before do 
      games_count.times do
        create :game
      end
    end

    before { get '/api/rest/games', nil, {'HTTP_ACCEPT' => Mime::JSON} }
   
    it_behaves_like 'success API response'

    it "should have 20 items" do
      games = JSON.parse(response.body)

      expect(games['games'].length).to eq games_count
    end

  end

  describe "GET api/rest/games/:id" do

    let(:game) {
      create :game
    }

    before { get "/api/rest/games/#{game.id}", nil, {'HTTP_ACCEPT' => Mime::JSON} }
   
    it_behaves_like 'success API response'

  end

  describe "POST api/rest/games" do

    context 'valid game' do
      let(:params) {
        { 
          game: {
            name: Faker::Lorem.characters(20),
            players_number: 7
          }
        } 
      }

      before { post '/api/rest/games', params, {'HTTP_ACCEPT' => Mime::JSON} }
     
      it_behaves_like 'success API response'
    end

    context 'not valid game' do

      let(:params) {
        { 
          game: {
            players_number: 7
          }
        } 
      }

      before { post '/api/rest/games', params, {'HTTP_ACCEPT' => Mime::JSON} }
     
      it 'returns error' do
        expect(response.status).to eq 422

        game = JSON.parse(response.body)
        
        expect(game["errors"]["name"]).to eq ["can't be blank"]
      end

    end

  end

  describe "PUT api/rest/games/:id" do

    let (:game) { create :game }

    let(:params) {
      { 
        game: {
          name: Faker::Lorem.characters(20),
          players_number: 8
        }
      } 
    }

    before { put "/api/rest/games/#{game.id}", params, {'HTTP_ACCEPT' => Mime::JSON} }
   
    it_behaves_like 'success API response'

  end

  describe "DELETE api/rest/games/:id" do

    let(:game) {
      create :game
    }

    before { delete "/api/rest/games/#{game.id}" }
   
    it_behaves_like 'success DELETE response'

  end

end
