class Api::V1::Items::SearchController < ApplicationController
  def index
    @items = Item.search_by_name(params[:name])

    if @items.empty?
      render json: { data: [] }, status: 200
    else
      render json: ItemSerializer.new(@items)
    end
  end
end
