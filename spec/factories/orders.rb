FactoryBot.define do
  factory :order do
  	order_id { "1" }
  	date { "10 Rue La bruyère" }  
    customer { FactoryBot.create(:customer) }
    country { FactoryBot.create(:country) }
  end
end