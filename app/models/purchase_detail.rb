class PurchaseDetail
  include ActiveModel::Model
  extend ActiveHash::Associations::ActiveRecordExtensions

  attr_accessor :user_id, :item_id, :post_number, :prefecture_id, :municipality, :address, :building_name, :phone_number
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\A0[5789]0\d{4}\d{4}\z/}
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Detail.create(purchase_id: purchase.id, post_number: post_number, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number)
  end
end
