class CartItemsController < ApplicationController
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.cart = current_user.cart
 
    if @cart_item.save
      redirect_to cart_path, notice: "Item added!"
    else
      redirect_back fallback_location: item_path(@cart_item.item_id),
                    alert: "Couldn’t add item."
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path, notice: "Item removed!"
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end
end
