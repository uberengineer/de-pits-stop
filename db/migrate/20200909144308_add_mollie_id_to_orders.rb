class AddMollieIdToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :mollie_id, :string
  end
end
