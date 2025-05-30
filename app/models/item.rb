class Item < ApplicationRecord
  belongs_to :user
  has_many   :order_items
  has_many   :reviews, through: :order_items

  CATEGORIES = [
  'Electronics',
  'Books',
  'Clothing',
  'Home',
  'Sports',
  'Beauty'
].freeze

validates :category,
          presence: true,
          inclusion: { in: CATEGORIES,message: "%{value} is not a valid category" }

  def average_rating
    if reviews.any?
      reviews.average(:rating).round(2)
    else
      "No reviews yet"
    end
  end
end
