json.extract! item, :id, :description, :list_id, :checked, :created_at, :updated_at
json.url item_url(item, format: :json)
