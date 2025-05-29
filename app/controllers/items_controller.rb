class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all

    if params[:category].present?
      @items = Item.where(category: params[:category])
    end

    if params[:search].present?
      @items = Item.where("name ILIKE ?", "%#{params[:search][:query]}%")
    end
  end
end
