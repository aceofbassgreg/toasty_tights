class Cart < ActiveRecord::Base
  has_many :order_items, dependent: :destroy

  def add_product(product_id)
  	order_items.find_by_product_id(product_id)
  	order_items.build(product_id: product_id)
  end
end
