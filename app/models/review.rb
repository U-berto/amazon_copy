class Review < ApplicationRecord
  belongs_to :order_item
  has_one :item,  through: :order_item
  has_one :user,  through: :order
end
