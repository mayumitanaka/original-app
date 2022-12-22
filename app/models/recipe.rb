class Recipe < ApplicationRecord
  with_options presence: true do
    validates :recipe_title
    validates :recipe_procedure
    validates :recipe_volume, format: { with: /\A\d{1,2}\z/, message: 'は半角数字を入力してください', allow_blank: true }
    validates :recipe_material
    validates :recipe_quantity
    validates :cooking_time, format: { with: /\A\d{1,3}\z/, message: 'は半角数字を入力してください', allow_blank: true }
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
