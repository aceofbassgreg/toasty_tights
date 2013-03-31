FactoryGirl.define do
  factory :product do
  	color "Black"
  	size "S"
  	in_stock 10
  	price 30
  end

  factory :order_item do
  	cart_id 1
  	product_id 1
    quantity 1
  end 


  factory :cart do
    add_product(1)
  end
end