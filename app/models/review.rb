class Review < ApplicationRecord
  belongs_to :order_item
  has_one :item, through: :order_item
  has_one :order, through: :order_item
  has_one :user, through: :order

  
  validates :comment, presence: true
  validates :rating, inclusion: { in: 1..5 }
end
