FactoryBot.define do
  factory :currency do
    name { "Рубль" }
    sign { "R" }
    code { "RUB" }
  end

  trait :dollar do
    name { "Доллар" }
    sign { "$" }
    code { "USD" }
  end
end
