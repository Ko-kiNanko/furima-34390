class Item_status < ActiveHash::Base
  include ActiveHash::Associations
  has_many :items
end