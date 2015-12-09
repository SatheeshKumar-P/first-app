json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :moible_nimber, :name, :city, :state, :country, :zip
  json.url user_url(user, format: :json)
end
