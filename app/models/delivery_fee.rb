class Delivery_fee < ActiveHash::Base
  include ActiveHash::Associations
  has_many :items
end