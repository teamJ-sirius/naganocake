class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  validates :item_id, :quantity, presence: true
  validates :quantity, numericality:{ only_integer: true }

  def subtotal
    item.with_tax_price * quantity
  end

end
