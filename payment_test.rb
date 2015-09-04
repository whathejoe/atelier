require "rubygems"
require "active_merchant"

ActiveMerchant::Billing::Base.mode = :test

gateway = ActiveMerchant::Billing::PaypalGateway.new(
  :login => "clvillarealiv-facilitator_api1.gmail.com",
  :password => "WYJLNDJ2RA277CTS",
  :signature => "AvcPG1.694xCJLdbetCjcTNqs3tmAwyDvxWHuQOlqutBV81LD-lBy3To"
)

credit_card = ActiveMerchant::Billing::CreditCard.new(
  :type               => "visa",
  :number             => "4032032185996920",
  :verification_value => "321",
  :month              => 1,
  :year               => Time.now.year+1,
  :first_name         => "Ryan",
  :last_name          => "Bates"
)

if credit_card.valid?
  # or gateway.purchase to do both authorize and capture
  response = gateway.authorize(1000, credit_card, :ip => "127.0.0.1")
  if response.success?
    gateway.capture(1000, response.authorization)
    puts "Purchase complete!"
  else
    puts "Error: #{response.message}"
  end
else
  puts "Error: credit card is not valid. #{credit_card.errors.full_messages.join('. ')}"
end
