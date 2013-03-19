class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  attr_accessible :cart_id, :product_id, :quantity

  validates :quantity, numericality: { greater_than: 0, less_than_or_equal_to: 10 }
  
  def enough_in_stock(order_item_quantity)
    if order_item.quantity > product.in_stock
      self.errors.add(:quantity, "Please try again with a smaller quantity")
    end
  end

end
