json.array!(@orders) do |order|
  json.extract! order, :id, :new, :cart_id, :ip_address, :first_name, :last_name, :card_type, :card_expires_on
  json.url order_url(order, format: :json)
end
