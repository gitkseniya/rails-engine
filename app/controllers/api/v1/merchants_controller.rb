class Api::V1::MerchantsController < ApplicationController
  def index
    @merchant = Merchant.all.limit(limit_per_page).offset(limit_pages)
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
