class ReviewsController < ApplicationController
  before_action :set_order_item

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.order_item = @order_item

    if @review.save
      redirect_to orders_path, notice: "Review successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_order_item
    @order_item = OrderItem.find(params[:order_item_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
