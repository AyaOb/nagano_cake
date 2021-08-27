class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum making_status: { not_startable: 0, waiting: 1, in_production: 2, completed: 3}

  def subtotal
    item.with_tax_price * amount
  end
end
