json.extract! user, :id, :username, :address, :phoneNumber, :email, :password_digest, :created_at, :updated_at
json.url user_url(user, format: :json)