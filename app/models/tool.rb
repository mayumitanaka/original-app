class tool < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '鍋(直径15cm程度)' },
    { id: 3, name: '鍋(直径25cm程度)' },
    { id: 4, name: 'フライパン(直径15cm程度)' },
    { id: 5, name: 'フライパン(直径30cm程度)' },
    { id: 6, name: '電子レンジ' },
    { id: 7, name: 'オーブン' },
    { id: 8, name: 'トースター' },
    { id: 9, name: 'フードプロセッサー' },
    { id: 10, name: 'ミキサー' }
    { id: 11, name: '泡立て器' }
  ]
   include ActiveHash::Associations
   has_many :users
   has_many :recipes
  end
