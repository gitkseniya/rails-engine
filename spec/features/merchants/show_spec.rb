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

      expect(info).to have_key(:id)
      expect(info[:id].to_i).to be_an(Integer)

      expect(info).to have_key(:type)
      expect(info[:type]).to eq('merchant')

      expect(info[:attributes]).to have_key(:name)
      expect(info[:attributes][:name]).to be_a(String)

    end
  end
end
