require 'rails_helper'

RSpec.describe "Filters", type: :request do
  describe "GET api/rest/filters" do
    let(:filters_count) { 20 }
    let(:user) { create :user }

    before do 
      filters_count.times do
        filter = build :filter
        filter.user = user
        filter.save
      end
    end

    before { get '/api/rest/filters', nil, {'HTTP_ACCEPT' => Mime::JSON} }
   
    it_behaves_like 'success API response'

    it "should have 20 items" do
      filters = JSON.parse(response.body)

      expect(filters['filters'].length).to eq filters_count
    end
  end

  describe "GET api/rest/filters/:id" do

    let(:user) {
      create :user
    }

    let(:filter) {
      build :filter
    }

    before do
      filter.user = user
      filter.save
    end

    before { get "/api/rest/filters/#{filter.id}", nil, {'HTTP_ACCEPT' => Mime::JSON} }
   
    it_behaves_like 'success API response'

  end

  describe "POST api/rest/filters" do

    context 'valid filter' do
      let(:params) {
        { 
          filter: {
            value: "{\"name\": \"sec\"}"
          }
        } 
      }

      before do
        create :user
      end

      before { post '/api/rest/filters', params, {'HTTP_ACCEPT' => Mime::JSON} }
     
      it_behaves_like 'success API response'
    end

    context 'not valid filter' do

      let(:params) {
        { 
          filter: {
            something: "bad"
          }
        } 
      }

      before do
        create :user
      end

      before { post '/api/rest/filters', params, {'HTTP_ACCEPT' => Mime::JSON} }
     
      it 'returns error' do
        expect(response.status).to eq 422

        filter = JSON.parse(response.body)
        
        expect(filter["errors"]["value"]).to eq ["can't be blank"]
      end

    end

  end

  describe "PUT api/rest/filters/:id" do

    let (:user) { create :user }

    let(:params) {
      { 
        filter: {
          value: "{\"name\": \"secon\"}"
        }
      } 
    }

    let(:filter) { build :filter }

    before do
      filter.user = user
      filter.save
    end

    before { put "/api/rest/filters/#{filter.id}", params, {'HTTP_ACCEPT' => Mime::JSON} }
   
    it_behaves_like 'success API response'

  end

  describe "DELETE api/rest/filters/:id" do

    let(:user) { create :user }
    let(:filter) { build :filter }

    before do
      filter.user = user
      filter.save
    end

    before { delete "/api/rest/filters/#{filter.id}" }
   
    it_behaves_like 'success DELETE response'

  end

end
