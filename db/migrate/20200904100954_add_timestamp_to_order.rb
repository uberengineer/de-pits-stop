class AddTimestampToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :time_started, :datetime
  end
end
