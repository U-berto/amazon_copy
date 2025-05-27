class Item < ApplicationRecord
  belongs_to :user
  has_many :reviews, through: :order_items
  
end
