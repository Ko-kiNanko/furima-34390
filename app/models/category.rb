class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' }, 
    { id: 2, name: '料理道具' },
    { id: 3, name: '雑誌' },
    { id: 4, name: '車用品' },
    { id: 5, name: 'マンガ' },
    { id: 6, name: 'DVD' },
    { id: 7, name: 'スマートフォン' },
    { id: 8, name: '小物' },
    { id: 9, name: 'グッズ' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end