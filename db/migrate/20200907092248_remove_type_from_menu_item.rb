class RemoveTypeFromMenuItem < ActiveRecord::Migration[6.0]
  def change
    remove_column :menu_items, :type, :string
  end
end
