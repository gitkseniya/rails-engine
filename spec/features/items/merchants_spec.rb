
require 'rails_helper'

RSpec.describe 'items merchant', type: :request do
  before :each do
    @merchant = create(:merchant)
    @item = create(:item, merchant_id: @merchant.id)
  end

  describe 'happy path' do
    it 'shows items merchant' do
      get api_v1_path(@item)

      json = JSON.parse(response.body)
      expect(response).to have_http_status(200)

      expect(json['data'].class).to eq(Hash)
      expect(json['data']['id'].to_i).to eq(@merchant.id)
      expect(json['data']['id'].to_i).to eq(@merchant.id)
    end
  end

  describe 'sad path' do
    it 'doesnt show merchant id' do
      expect { get '/api/v1/items/2/merchant' }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
