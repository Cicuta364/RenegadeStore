json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :price, :stock, :photos
  json.url product_url(product, format: :json)
end
