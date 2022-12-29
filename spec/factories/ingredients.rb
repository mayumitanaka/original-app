FactoryBot.define do
  factory :ingredient do
    ing      { Faker::Food.ingredient }
    quantity { Faker::Food.measurement }
    association :recipe
  end
end
