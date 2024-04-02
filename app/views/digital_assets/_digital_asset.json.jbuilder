json.extract! digital_asset, :id, :name, :url, :views, :created_at, :updated_at
json.url asset_url(digital_asset, format: :json)
