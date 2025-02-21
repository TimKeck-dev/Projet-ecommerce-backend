json.extract! @order, :id, :status, :total_price
json.user @order.user, :id, :email
json.order_items @order.order_items do |order_item|
  json.extract! order_item, :id, :quantity
  json.product order_item.product, :id, :name, :price
end
