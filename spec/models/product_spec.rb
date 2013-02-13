require 'spec_helper'

describe Product do

  before do
  	@product = Product.new(color: "Black", size: "S", price: 30, in_stock: 10, quantity: 1)
  end

  subject { @product }

  it { should respond_to(:size) }
  it { should respond_to(:color) }
  it { should respond_to(:in_stock) }
  it { should respond_to(:price) }

  it { should be_valid }

  describe "with invalid attributes" do

    context "with invalid color" do
      before { @product.color = "Yellow" }
      it { should_not be_valid }
    end

    context "with invalid size" do
      before { @product.size = "X" }
      it { should_not be_valid }
    end

    context "with negative in_stock" do
      before { @product.in_stock = -1 }
      it { should_not be_valid }
    end

    context "with less in-stock than quantity ordered" do
      before do
      	@product.in_stock = 1
      	@product.quantity = 2
      end

      it { should_not be_valid }
    end

    context "with non-integer price" do
  	  before { @product.price = "thirty" }
  	  it { should_not be_valid }
    end

    context "with negative integer price" do
  	  before { @product.price = -30.00 }
  	  it { should_not be_valid }
    end

    context "with too high a quantity" do
      before { @product.quantity = 11 }
      it { should_not be_valid }
    end

    context "with too low a quantity" do
      before { @product.quantity = 0 }
      it { should_not be_valid }
    end

    context "with non-integer quantity" do
  	  before { @product.quantity = "one" }
  	  it { should_not be_valid }
    end

    context "with negative integer quantity" do
  	  before { @product.quantity = -1 }
  	  it { should_not be_valid }
    end
  end
end

