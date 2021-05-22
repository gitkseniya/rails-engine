require 'rails_helper'

RSpec.describe "Merchants API", type: :request do
  before :each do
    @merchant = create(:merchant)

    get "/api/v1/merchants/#{@merchant.id}"
  end

  describe 'merchant show' do
    it "returns one merchant" do

      expect(response).to be_successful

      @merchant = JSON.parse(response.body, symbolize_names: true)

      expect(@merchant[:data]).to have_key(:id)
      expect(@merchant[:data][:id].to_i).to be_an(Integer)

      expect(@merchant[:data]).to have_key(:type)
      expect(@merchant[:data][:type]).to eq('merchant')

      expect(@merchant[:data][:attributes]).to have_key(:name)
      expect(@merchant[:data][:attributes][:name]).to be_a(String)

    end
  end
end
