class MenuItemsController < ApplicationController
  def index
    if @kitchen.kitchen_status
      @menu_items = MenuItem.all
      @cart = Order.find_or_create_by(user_id: current_user.id, status: "in progress")
      @order_item = OrderItem.new()
    else
      redirect_to closed_kitchen_path
    end
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
    params.require(:menu_item).permit(:name, :description, :price_cents, :image, :category)
  end

end
