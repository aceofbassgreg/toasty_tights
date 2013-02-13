class Product < ActiveRecord::Base
  attr_accessible :color, :in_stock, :price, :size, :quantity
  				  # :enough_in_stock

  validates :color, inclusion: { :in => %w(Black Charcoal Wine Plum) }
  validates :in_stock, numericality: { greater_than_or_equal_to: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 1 }
  validates :size, inclusion: { :in => %w(S M L Children's) }
  validates :quantity, numericality: { greater_than_or_equal_to: 1, 
  									   less_than_or_equal_to: 10  }
  validate :enough_in_stock

 def enough_in_stock
    if quantity > in_stock
      self.errors.add(:quantity, "Please try again with a smaller quantity")
    end
  end
end

  
