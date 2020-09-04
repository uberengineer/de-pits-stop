class AddQuantityToMenuItems < ActiveRecord::Migration[6.0]
  def change
    add_column :menu_items, :available, :boolean, default: :true
  end
end
