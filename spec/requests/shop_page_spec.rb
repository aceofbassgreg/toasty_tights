require 'spec_helper'

describe "Shop Page" do
  before { visit shop_path }

  describe "when products are in-stock" do
    product = FactoryGirl.build(:product)
 
    before do
      select('Black - S', from: 'order_item_product_id')
      fill_in "Quantity", with: "1"
      click_button "Add to Cart"
    end

    it { should have_content('Item Successfully Added!') }
  end

  # describe "when products are out of stock" do
  #   before do
  #     product.in_stock == 0
  #     click_link "Select Product"
  #   end

  #   it { should_not have_content('Black - S') }
  # end

  # describe "when customer tries adding more products than are in-stock" do
    
  #   before do
  #     fill_in "Quantity", with: 11
  #     click_button "Add to Cart"
  #   end

  #   it { should have_content('error') }
  #   it { should_not have_content('Item Successfully Added!') }
  # end
end