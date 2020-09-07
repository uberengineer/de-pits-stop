class CreateKitchens < ActiveRecord::Migration[6.0]
  def change
    create_table :kitchens do |t|
      t.boolean :kitchen_status, default: false

      t.timestamps
    end
  end
end
