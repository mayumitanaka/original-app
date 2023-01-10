class CategoryDish < ActiveHash::Base
  self.data = [
    { id: 1, name: '野菜料理' },
    { id: 2, name: '肉料理' },
    { id: 3, name: '卵料理' },
    { id: 4, name: '魚料理' },
    { id: 5, name: '米料理' },
    { id: 6, name: '麺料理' }
  ]

  include ActiveHash::Associations
  has_many :recipes
end
