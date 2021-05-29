require 'rails_helper'

RSpec.describe 'merchant items index', type: :request do
  before :each do
    @merchant = create(:merchant)
    @items = create_list(:item, 5, merchant: @merchant)
    @item6 = create(:item)

    get "/api/v1/merchants/#{@merchant.id}/items"
  end

  describe 'hapy path' do
    it 'shows items for a merchant' do
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)

      expect(json[:data].class).to eq(Array)
      expect(json[:data].first[:id].to_i).to eq(@items.first.id)
    end
  end

  describe 'sad path' do
    it 'doesnt show items for a merchant' do
      expect { get api_v1_merchant_items_path(@item6.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
