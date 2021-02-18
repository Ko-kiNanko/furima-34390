class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.integer :category_id, null: false
      t.integer :price, null: false
      t.integer :item_status_id, null: false
      t.text :information, null: false
      t.integer :prefecture_id, null: false
      t.integer :delivery_fee_id, null: false
      t.integer :shipping_day_id, null: false
      t.timestamps
    end
  end
end
