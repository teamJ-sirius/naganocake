class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id #customersテーブルの顧客ID
      t.integer :postage #一律800円
      t.integer :total_price #cart_price + 800円
      t.integer :order_status,default: 0 #(0:入金待ち 1:入金確認 2:製作中 3:発送準備中 4:発送済み)のいずれか デフォルト値は0
      t.string :post_code
      t.string :address
      t.string :name
      t.integer :payment_method #(0:クレジットカード 1:銀行振込)のいずれか
      t.timestamps
    end
  end
end
