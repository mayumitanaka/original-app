FactoryBot.define do
  factory :recipe do
    recipe_title     { Faker::Food.dish }
    recipe_procedure { Faker::Food.description }
    recipe_volume    { Faker::Number.between(from: 1 , to:99) }
    recipe_material  { Faker::Food.ingredient }
    recipe_quantity  { Faker::Food.measurement }
    cooking_time     { Faker::Number.between(from: 1, to: 999) }
    tool_id          { Faker::Number.between(from: 2, to: 11) }
    category_id      { Faker::Number.between(from: 2, to: 9) }
    association :user

    after(:build) do |recipe|
      recipe.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
