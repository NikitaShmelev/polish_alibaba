json.extract! product, :id, :title, :description, :short_description, :image, :price, :quantity, :campaign_id, :created_at, :updated_at
json.url product_url(product, format: :json)
