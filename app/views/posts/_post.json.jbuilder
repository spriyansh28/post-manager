json.extract! post, :id, :title, :body, :main_image, :created_at, :updated_at
json.url post_url(post, format: :json)
