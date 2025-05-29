class Order < ApplicationRecord
  default_scope { order(created_at: :desc) }
  belongs_to :user
  has_many   :order_items
  has_many   :items,       through: :order_items
end
