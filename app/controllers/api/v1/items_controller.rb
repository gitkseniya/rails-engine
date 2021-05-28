class Api::V1::ItemsController < ApplicationController
  def index
    if params[:merchant_id].present?
      @merchant = Merchant.find(params[:merchant_id])
      @item = @merchant.items.all
    else
      @item = Item.all.limit(limit_per_page).offset(limit_pages)
    end
    render json: ItemSerializer.new(@item)
  end

  def show
    @item = Item.find(params[:id])
    render json: ItemSerializer.new(@item)
  end

  def create
    @merchant = Merchant.find(params[:merchant_id])
    @item = @merchant.items.create(item_params)
    if @item.save
      render json: ItemSerializer.new(@item), status: :created
    end
  end

  def edit
    @merchant = Merchant.find(params[:merchant_id])
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      render json: ItemSerializer.new(@item)
    else
      render json: { data: {} }, status: 400
    end
  end


  def destroy
    @item = Item.find(params[:id])
    @invoices = @item.invoices

    Invoice.destroy(@invoices)
    @item.destroy
  end

  def item_merchant
    @merchant = Item.find(params[:id]).merchant

    render json: MerchantSerializer.new(@merchant)
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
  end

end
