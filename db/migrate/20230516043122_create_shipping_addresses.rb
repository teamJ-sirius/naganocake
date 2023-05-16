class CreateShippingAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :shipping_addresses do |t|
      # 顧客ID
      t.integer :customer_id, null: false
      # 配送先名前
      t.string :address_name, null: false
      # 郵便番号
      t.string :post_code, null: false
      # 住所
      t.string :address, null: false
      

      t.timestamps
    end
  end
end
