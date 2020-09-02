class MenuItemsController < ApplicationController
  def index
    @menu_items = MenuItem.all
    @cart = Order.where(user_id: current_user.id, status: "in progress").first_or_create
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
    redirect_to menu_items_path
  end

  private

  def strong_params
    params.require(:menu_item).permit(:name, :description, :price, :image)
  end

end
