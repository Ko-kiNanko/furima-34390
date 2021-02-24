class Purchase < ApplicationRecord
  has_one :details
  belongs_to :user
  belongs_to :item
end
