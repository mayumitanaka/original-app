class CategoryMenu < ActiveHash::Base
  self.data = [
    { id: 1, name: '主菜' },
    { id: 2, name: '副菜' },
    { id: 3, name: '汁物' }
  ]

  include ActiveHash::Associations
  has_many :recipes
end
