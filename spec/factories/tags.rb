FactoryBot.define do
  factory :tag do
    name { Faker::Lorem.characters(number: 8) }
    category_id { Faker::Number.non_zero_digit }
    association :user
  end
end
