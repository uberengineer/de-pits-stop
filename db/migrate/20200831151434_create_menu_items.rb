class CreateMenuItems < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.string :type

      t.timestamps
    end
  end
end
