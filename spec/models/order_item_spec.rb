require 'spec_helper'

describe OrderItem do
  before do
  	@order_item = OrderItem.new(product_id: 1, cart_id: 1, quantity: 1)
  end

  subject (@order_item)

  it { should respond_to(:product_id) }
  it { should respond_to(:cart_id) }
  it { should respond_to(:product) }
  it { should respond_to(:cart) }


    context "with too high a quantity" do
      before { @order_item.quantity = 11 }
      it { should_not be_valid }
    end

    context "with too low a quantity" do
      before { @order_item.quantity = 0 }
      it { should_not be_valid }
    end

    context "with non-integer quantity" do
  	  before { @order_item.quantity = "one" }
  	  it { should_not be_valid }
    end

    context "with negative integer quantity" do
  	  before { @order_item.quantity = -1 }
  	  it { should_not be_valid }
    end

    # context "with less in-stock than quantity ordered" do
    #   before do
    #   	@product.in_stock = 1
    #     @order_item.quantity = 2
    #   end

    #   it { should_not be_valid }
    # end
end
