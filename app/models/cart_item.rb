class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  validates :item_id, :quantity, presence: true
  validates :quantity, numericality:{ only_integer: true }

  def sum_of_price
    item.taxin_price * quantity
  end

end
