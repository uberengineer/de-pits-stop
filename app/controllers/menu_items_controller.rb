class MenuItemsController < ApplicationController
  def index
    @menu_items = MenuItem.all
    @cart = Order.first_or_create(user: current_user, status: "in progress")
    @order_item = OrderItem.new()
  end

  def show
    @menu_item = MenuItem.find(params[:id])
  end

  def new
    @menu_item = MenuItem.new()
  end

  def create
    @menu_item = MenuItem.create(strong_params)
  end

  private

  def strong_params
    params.require(:menu_item).permit(:name, :description)
  end

end
