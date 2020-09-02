class ChangeMenuItemsPriceFloat < ActiveRecord::Migration[6.0]
  def change
    change_table :menu_items do |t|
      t.change :price, :float
    end
  end
end
