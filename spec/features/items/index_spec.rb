require 'rails_helper'

RSpec.describe 'items API', type: :request do
  before :each do
    create_list(:item, 51)
  end

  describe 'item index' do
    it 'returns all items' do
      get '/api/v1/items'

      items = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(200)

      expect(items[:data].count).to eq(20)

      items[:data].each do |item|
        expect(item).to have_key(:id)
        expect(item[:id].to_i).to be_an(Integer)
        expect(item).to have_key(:type)
        expect(item[:type]).to eq('item')
        expect(item[:attributes]).to have_key(:name)
        expect(item[:attributes][:name]).to be_a(String)
        expect(item[:attributes][:description]).to be_a(String)
        expect(item[:attributes][:unit_price]).to be_a(Float)
      end
    end

    it 'returns page 2 with 20 items' do
      get '/api/v1/items?page=2&per_page=20'

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(200)
      expect(json[:data].count).to eq(20)
      expect(json[:data].first[:id].to_i).to be_an(Integer)
    end

    it 'returns 50 items per page' do
      get '/api/v1/items?per_page=50'

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(200)
      expect(json[:data].count).to eq(50)
      expect(json[:data].first[:id].to_i).to be_an(Integer)
    end

    it 'returns an empty array if no items' do
      get '/api/v1/items?page=72&per_page=20'

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(200)
      expect(json[:data].count).to eq(0)
    end

  end
end
