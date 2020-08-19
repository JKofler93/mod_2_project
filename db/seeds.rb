require 'faker'

User.destroy_all
Currency.destroy_all
UserCurrency.destroy_all

2.times do 
    User.create(user_name: Faker::Name.name  ,age: Faker::Number.within(range: 18..109) , balance: Faker::Number.within(range: 100..10000)  )
end
  
bitcoin = Currency.create(price: 175, symbol: "BTC", crypto: "Bitcoin" )
ethereum = Currency.create(price: 200, symbol: "ATH", crypto: "Etheruem" )
litecoin = Currency.create(price: 30, symbol: "LTC", crypto: "Litecoin" )
dodgecoin = Currency.create(price: 42, symbol: "DOGE", crypto: "Dodgecoin" )
ripplecoin = Currency.create(price: 420, symbol: "XRP", crypto: "Ripple" )



5.times do
    UserCurrency.create(amount: Faker::Number.within(range: 100..1000) , user_id: User.all.sample.id , currency_id: Currency.all.sample.id) ### User.all.sample.id
end 