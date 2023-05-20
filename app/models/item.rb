class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_details

  has_many_attached :images

  validates :item_name, presence: true
  validates :sales_status, inclusion: { in: [true, false] }
end
