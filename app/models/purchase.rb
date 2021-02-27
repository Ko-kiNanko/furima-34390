class Purchase < ApplicationRecord
  has_one :detail
  belongs_to :user
  belongs_to :item
end
