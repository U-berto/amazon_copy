class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order
  has_many   :reviews
end
