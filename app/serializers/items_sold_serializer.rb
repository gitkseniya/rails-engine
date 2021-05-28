class ItemsSoldSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name

  attribute :count do |merchant|
    merchant.count_items_sold
  end

end
