class Recipe < ApplicationRecord
  with_options presence: true do
    validates :recipe_title
    validates :recipe_procedure
    validates :recipe_volume, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 99,
                                              allow_blank: true }, format: { with: /\d/, allow_blank: true }
    validates :recipe_material
    validates :recipe_quantity
    validates :cooking_time, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 999,
                                             allow_blank: true }, format: { with: /\d/, allow_blank: true }
    validates :tool_id, numericality: { other_than: 1, message: 'を入力してください' }
    validates :category_id, numericality: { other_than: 1, message: 'を入力してください' }
  end

  belongs_to :user
  # has_many   :menus
  # has_many   :recipe_tags
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :tool
  belongs_to :category
end
