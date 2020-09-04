class AddCompletedTimestamp < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :time_finished, :datetime
  end
end
