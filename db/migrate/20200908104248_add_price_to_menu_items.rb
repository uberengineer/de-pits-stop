class AddPriceToMenuItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :menu_items, :price, :integer
    add_monetize :menu_items, :price, currency: { present: false }
  end
end
