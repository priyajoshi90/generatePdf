json.array!(@products) do |product|
  json.extract! product, :id, :name, :qty, :price
  json.url product_url(product, format: :json)
end
