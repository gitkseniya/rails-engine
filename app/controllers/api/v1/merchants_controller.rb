class Api::V1::MerchantsController < ApplicationController
  def index
    @merchant = Merchant.first(20)
    render json: MerchantSerializer.new(@merchant)
  end

  def show
    @merchant = Merchant.find(params[:id])
    render json: MerchantSerializer.new(@merchant)

  end


  def find_all
    @merchant = Merchant.find_first(params[:name])
    render json: MerchantSerializer.new(@merchant)
  end

end
