class Api::V1::Items::SearchController < ApplicationController
  def index
    @items = Item.search_by_name(params[:name])

    if @items.empty?
      { data: [] }
    else
      render json: ItemSerializer.new(@items)
    end

  end
end
