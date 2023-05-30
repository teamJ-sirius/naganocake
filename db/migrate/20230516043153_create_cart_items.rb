class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      # 顧客ID
      t.integer :customer_id, null: false
      # 商品ID
      t.integer :item_id, null: false
      # 個数
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
