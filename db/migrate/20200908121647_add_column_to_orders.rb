class AddColumnToOrders < ActiveRecord::Migration[6.0]
  def change
    add_monetize :orders, :amount
  end
end
