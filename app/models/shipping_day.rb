class Shipping_day < ActiveHash::Base
  include ActiveHash::Associations
  has_many :items
end