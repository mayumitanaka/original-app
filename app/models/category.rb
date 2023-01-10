class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '主菜' },
    { id: 2, name: '副菜' },
    { id: 3, name: '汁物' },
    { id: 4, name: '野菜料理' },
    { id: 5, name: '肉料理' },
    { id: 6, name: '卵料理' },
    { id: 7, name: '魚料理' },
    { id: 8, name: '豆料理' }
  ]

  include ActiveHash::Associations
  has_many :recipes
end
