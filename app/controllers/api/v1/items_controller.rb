class Api::V1::ItemsController < ApplicationController
  def index
    if params[:merchant_id].present?
      @merchant = Merchant.find(params[:merchant_id])
      @item = @merchant.items.all
    else
      @item = Item.all
    end
    render json: ItemSerializer.new(@item)
  end

  def show
    @item = Item.find(params[:id])
    render json: ItemSerializer.new(@item)
  end
end
