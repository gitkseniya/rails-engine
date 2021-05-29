require 'rails_helper'

RSpec.describe 'Merchants API', type: :request do
  before :each do
    create_list(:merchant, 30)
  end

  describe 'merchant index' do
    it 'returns first 20 merchants' do
      get '/api/v1/merchants'

      expect(response).to be_successful

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(merchants[:data].count).to eq(20)

      merchants[:data].each do |merchant|
        expect(merchant).to have_key(:id)
        expect(merchant[:id].to_i).to be_an(Integer)
        expect(merchant).to have_key(:type)
        expect(merchant[:type]).to eq('merchant')
        expect(merchant[:attributes]).to have_key(:name)
        expect(merchant[:attributes][:name]).to be_a(String)
      end
    end
  end
end
