class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_many :items, dependent: :destroy
  has_one :cart, dependent: :destroy
  has_many :cart_items, through: :cart
  has_many :order_items, through: :orders
  after_create :generate_cart

  def generate_cart
    Cart.create!(user: self)
  end
end
