class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :denre

  has_one_attached :image

  validates :item_name, presence: true
end
