FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 6) }
    password_confirmation { password }
    item_category_id      { Faker::Number.between(from: 2, to: 11) }
  end
end
