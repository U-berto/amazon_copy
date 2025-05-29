class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def create
    @order = Order.create(status:"Confirmed", user_id: current_user.id)
    @order_items = current_user.cart_items.each do |cart_item|
      order_item_attributes = {
        item_id: cart_item.item_id,
        quantity: cart_item.quantity,
        order_id: @order.id,
        price: cart_item.item.price
      }
      OrderItem.create(order_item_attributes)
      cart_item.destroy!
    end
    if @order.save
      redirect_to orders_path, notice: 'Thanks for your purchase!'
    else
      redirect_to cart_path, notice: "Something went wrong..."
    end
  end
end
