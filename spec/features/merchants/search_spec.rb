require 'rails_helper'

RSpec.describe 'items search', type: :request do
  before :each do
    @merchant1 = create(:merchant, name: "Lulu")
    @merchant2 = create(:merchant, name: "Zara")
    @merchant3 = create(:merchant, name: "LV")
    @merchant4 = create(:merchant, name: "HM")
  end

  describe 'happy path' do
    it 'shows a search result' do
      get api_v1_merchants_find_path, params: { name: 'Za' }

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(200)
      expect(json[:data].class).to eq(Hash)

      expect(json[:data][:type]).to eq('merchant')
      expect(json[:data][:attributes].class).to eq(Hash)
      expect(json[:data][:attributes][:name]).to eq(@merchant2.name)
    end

    it 'doesnt show a search result' do
      get api_v1_merchants_find_path, params: { name: '321' }

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(200)
      expect(json[:data]).to eq({})
    end
  end
end
