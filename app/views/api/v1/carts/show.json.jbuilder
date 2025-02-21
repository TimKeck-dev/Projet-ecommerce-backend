json.extract! @cart, :id
json.products @cart.products do |product|
  json.extract! product, :id, :name, :price
end
