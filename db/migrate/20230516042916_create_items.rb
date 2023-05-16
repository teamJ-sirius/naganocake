class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      #ジャンルID
      t.integer :genre_id
      #商品名
      t.string :item_name
      #商品説明文
      t.text :item_description
      #商品価格（税抜）
      t.integer :price
      #販売ステータス
      t.boolean :sales_status
      t.timestamps
    end
  end
end
