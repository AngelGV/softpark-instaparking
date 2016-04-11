json.array!(@rents) do |rent|
  json.extract! rent, :id, :title, :description, :price, :addres, :phone, :user_id, :district_id, :type_id
  json.url rent_url(rent, format: :json)
end
