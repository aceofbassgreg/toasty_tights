require 'spec_helper'

describe Product do

  before do
  	@product = Product.new(color: "Black", size: "S", price: 30, in_stock: 10)
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

    context "with non-integer price" do
  	  before { @product.price = "thirty" }
  	  it { should_not be_valid }
    end

    context "with negative integer price" do
  	  before { @product.price = -30.00 }
  	  it { should_not be_valid }
    end
  end
end

