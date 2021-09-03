FactoryBot.define do
  factory :meal_tag_relation do
    association :meal
    association :tag
  end
end
