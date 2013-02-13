require 'spec_helper'

describe "StaticPages" do

  subject { page }
  
  describe "Home Page" do
    before { visit root_path }

    it { should have_selector('h3', text: 'Our Mission') }

    it "should have the right links" do
      click_link "About"
      page.should have_selector 'h3', text: "About Us"
      click_link "FAQ"
      page.should have_selector 'h3', text: "Frequently Asked Questions"
      click_link "Shop"
      page.should have_selector 'h3', text: "Please select size, color, and quantity:"
    end
  end

  # describe "Shop Page" do
  #   before { visit shop_path }

  #   describe "when products are in-stock" do
  #     before { click_link "Select Product" }
  #     product = FactoryGirl.build(:product)
 
  #     it { should have_selector 'option', text: "Small Black" }
  #     end
        
  #     describe "adding available products to cart" do
  #       before do
  #         select 'Option', from: 'Select Box'
  #         fill_in "Quantity", with: "1"
  #         click_button "Add to Cart"
  #       end

  #       it { should_not have_content('error') }
  #       it { should have_content('Item Successfully Added!') }
  #     end
  #   end

  #   describe "when products are out of stock" do
  #     #set quantity of small black to 0
  #     before { click_link "Select Product" }

  #     it { should_not have_content('Small Black') }
  #   end

  #   describe "when customer tries adding more products than are in-stock" do
    
  #     before do
  #       fill_in "Quantity", with: 11
  #       click_button "Add to Cart"
  #     end

  #     it { should have_content('error') }
  #     it { should_not have_content('Item Successfully Added!') }
  #   end
  #   #     pending expect(click_button "Add to Cart").to change().by 1
  # end
end

