require 'rails_helper'

RSpec.describe 'items search', type: :request do
  before :each do
    @item1 = create(:item, name: "testing")
    @item2 = create(:item, name: "nesting")
    @item3 = create(:item, name: "effective")
    @item4 = create(:item, name: "zero")
  end

  describe 'happy path' do
    it 'shows a search result' do
      get api_v1_items_find_all_path, params: { name: 'est' }

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(200)
      expect(json[:data].class).to eq(Array)
      expect(json[:data].first[:type]).to eq('item')
      expect(json[:data].first[:attributes].class).to eq(Hash)
      expect(json[:data].first[:attributes][:name]).to eq(@item2.name)
      expect(json[:data].first[:attributes][:description]).to eq(@item2.description.to_s)

    end

    it 'doesnt show a search result' do
      get api_v1_items_find_all_path, params: { name: '123' }

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(200)
      expect(json[:data]).to eq([])
    end
  end
end
