class ChangePickupTimeToString < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :pickup_time, :string, default: "As soon as possible"
  end
end
