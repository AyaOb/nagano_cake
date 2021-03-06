class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy

  validates :image, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :genre, presence: true

  attachment :image

  enum is_active: { on_sale: true, sold_out: false}

  def with_tax_price
    (price * 1.1).floor
  end
end
