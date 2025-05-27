class Item < ApplicationRecord
  belongs_to :user
  has_many   :reviews, through: :order_items

  CATEGORIES = [
  'Electronics',
  'Books',
  'Clothing',
  'Home & Kitchen',
  'Sports & Outdoors',
  'Beauty & Personal Care'
].freeze

validates :category,
          presence: true,
          inclusion: { in: CATEGORIES,message: "%{value} is not a valid category" }
end
