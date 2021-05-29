class Api::V1::Revenue::MerchantsController < ApplicationController
  def index
  end

  def show
    @merchant = Merchant.find(params[:id])
    render json: MerchantRevenueSerializer.new(@merchant)
  end
end
