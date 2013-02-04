require 'spec_helper'

describe "StaticPages" do

  subject { page }
  
  describe "Store Page" do
    before { visit root_path }

    it { should have_selector('h1', text: 'Warm and Toasty Tights') }
    it { should have_selector('h3', text: 'Please select size, color, and quantity:') }

    # specs for checking images and drop-down menus

    it "should have the right links" do
      click_link "Why Warm and Toasty?"
      page.should have_selector 'h1', text: "Why Warm and Toasty Tights?"
      click_link "About"
      page.should have_selector 'h1', text: "About Us"
      click_link "FAQ"
      page.should have_selector 'h1', text: "Frequently Asked Questions"
      click_link "Store"
      page.should have_selector 'h1',    text: "Warm and Toasty Tights"
    end
  end
end
