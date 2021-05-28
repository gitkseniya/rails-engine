class Api::V1::Merchants::SearchController < ApplicationController
  def show
    @merchant = Merchant.search_by_name(params[:name])

    if @merchant.nil?
      render json: { data: {}, error: 'errors' }, status: 200
    else
      render json: MerchantSerializer.new(@merchant)
    end
  end
end
