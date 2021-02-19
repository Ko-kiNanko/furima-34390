class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :delivery_fee
    belongs_to :item_status
    belongs_to :prefecture
    belongs_to :shipping_day

  with_options presence: true do
    validates :item_name
    validates :price, format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/ }, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
    validates :information
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
    validates :delivery_fee_id
    validates :shipping_day_id
    validates :category_id
    validates :item_status_id
  end

  belongs_to :user
  has_one_attached :image


end
