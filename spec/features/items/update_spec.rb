require 'rails_helper'

RSpec.describe 'items update', type: :request do
  describe 'happy path' do
    before :each do
      @merchant = create(:merchant)
      @item = create(:item, description: "large")
      @params = {
        name: 'toy',
        description: 'small',
        unit_price: 9.29,
        merchant_id: @merchant.id
      }
    end

      it 'can update an item' do
        patch api_v1_item_path(@item), params: @params
        json = JSON.parse(response.body)

        expect(response).to have_http_status(200)
        expect(json['data']['attributes']['description']).to eq(@params[:description])
      end
  end
end
