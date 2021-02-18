class Item < ApplicationRecord
  
  validates :item_name, null: false
  validates :category_id, null: false
  validates :price, null: false
  validates :item_status_id, null: false
  validates :information, null: false
  validates :prefecture, null: false
  validates :delivery_fee_id, null: false
  validates :shipping_day_id, null: false
  
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_fee
  belongs_to :item_status
  belongs_to :prefecture
  belongs_to :shipping_day
end
