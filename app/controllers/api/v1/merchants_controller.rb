class Api::V1::MerchantsController < ApplicationController
  def index
    # validations on params
    @merchant = Merchant.find_first(params[:name])
    render json: MerchantSerializer.new(@merchant)
  end

end
