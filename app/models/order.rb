class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details

  validates :post_code, format: {with: /\A[0-9]{7}\z/}
  validates :address,presence:true
  validates :name,presence:true
  validates :payment_method,presence:true

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: {"入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4}

end
