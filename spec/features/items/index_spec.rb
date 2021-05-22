require 'rails_helper'

RSpec.describe "items API", type: :request do
  before :each do
    create_list(:item, 30)
  end

  describe 'item index' do
    it "returns all items" do

      get '/api/v1/items'

      expect(response).to be_successful

      items = JSON.parse(response.body, symbolize_names: true)

      expect(items[:data].count).to eq(30)

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
  end
end
