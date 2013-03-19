class Product < ActiveRecord::Base
  attr_accessible :color, :in_stock, :price, :size
  has_many :order_items
  				  # :enough_in_stock

  validates :color, inclusion: { :in => %w(Black Charcoal Wine Plum) }
  validates :in_stock, numericality: { greater_than_or_equal_to: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 1 }
  validates :size, inclusion: { :in => %w(S M L Children's) }

 def enough_in_stock(order_item_quantity)
    if order_item.quantity > product.in_stock
      self.errors.add(:quantity, "Please try again with a smaller quantity")
    end
  end
end
