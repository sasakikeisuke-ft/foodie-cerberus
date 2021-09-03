FactoryBot.define do
  factory :meal do
    name { Faker::Lorem.characters(number: 8) }
    last_day { Faker::Date.between(from: 50.years.ago, to: Date.today) }
    price_id { Faker::Number.non_zero_digit }
    calorie_id { Faker::Number.non_zero_digit }
    link { Faker::Lorem.sentence }
    association :user
  end
end
