class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  #belongs_to :genre

  has_one_attached :image

  validates :item_name, presence: true
  validates :sales_status, inclusion: { in: [true, false] }
end
