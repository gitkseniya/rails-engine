require 'rails_helper'

RSpec.describe 'items create', type: :request do
  describe 'happy path' do
    before :each do
      @merchant = create(:merchant)
      @items = create_list(:item, 5)
      @params = {
        name: 'toy',
        description: 'fluffy',
        unit_price: 9.99,
        merchant_id: @merchant.id
      }
    end

      it 'can create an item' do
        expect(Item.count).to eq(5)

        post api_v1_items_path, params: @params

        expect(Item.count).to eq(6)
        expect(response).to have_http_status(:created)
      end
  end
end
