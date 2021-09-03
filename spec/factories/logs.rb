FactoryBot.define do
  factory :log do
    association :user
    association :meal
  end
end
