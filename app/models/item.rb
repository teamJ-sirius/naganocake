class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre

  has_one_attached :image

  def with_tax_price
    (price * 1.1).floor
  end

  validates :genre_id, presence: true
  validates :item_name, presence: true, length: { maximum: 20 }
  validates :item_description, presence: true, length: { maximum: 100 }
  validates :price, presence: true
  validates :sales_status, inclusion: { in: [true, false] }
  attribute :sales_status, :boolean, default: false
  validates :image, presence: true
end
