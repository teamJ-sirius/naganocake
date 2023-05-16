class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :order_id #ordersテーブルの注文ID
      t.integer :item_id #productsテーブルの商品ID
      t.integer :quantity
      t.integer :order_price
      t.integer :making_status #(0:着手不可 1:製作待ち 2:製作中 3:製作完了)のいずれか。(1:製作待ち)のみordersテーブルの注文ステータスに紐づいて自動更新 デフォルト値は0
      t.timestamps
    end
  end
end
