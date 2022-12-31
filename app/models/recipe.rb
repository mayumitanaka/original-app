class Recipe < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :recipe_title
    validates :recipe_volume, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 99,
                                              allow_blank: true }, format: { with: /\d/, allow_blank: true }
    validates :cooking_time, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 999,
                                             allow_blank: true }, format: { with: /\d/, allow_blank: true }
    validates :category_id, numericality: { other_than: 1, message: 'を入力してください' }
    validates :recipe_procedure
  end

  belongs_to :user
  has_many   :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: true
  has_many :favorites, dependent: :destroy
  # has_many   :menus
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :tool
  belongs_to :category

  def favorited?(user)
    favorites.where(user_id: user.id).exists?
 end
end
