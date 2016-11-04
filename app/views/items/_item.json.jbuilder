json.extract! item, :id, :title, :image, :price, :location, :category_id, :created_at, :updated_at
json.url item_url(item, format: :json)