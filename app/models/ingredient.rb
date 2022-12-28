class Ingredient < ApplicationRecord
  with_options presence: true do
    validates :ing
    validates :quantity
  end

  belongs_to :recipe
end
