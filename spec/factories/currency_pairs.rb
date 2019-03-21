FactoryBot.define do
  factory :currency_pair do
    base_id { 1 }
    quote_id { 2 }
    price { 70.5 }
  end
end
