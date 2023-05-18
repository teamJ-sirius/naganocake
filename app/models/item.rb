class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_details

  has_many_attached :images

  validates :name, presence: true
end
