require 'spec_helper'

describe "StaticPages" do

  subject { page }
  
  describe "Home Page" do
    before { visit root_path }

    it { should have_selector('h3', text: 'Our Mission') }

    # specs for checking images and drop-down menus

    it "should have the right links" do
      click_link "About"
      page.should have_selector 'h3', text: "About Us"
      click_link "FAQ"
      page.should have_selector 'h3', text: "Frequently Asked Questions"
      click_link "Shop"
      page.should have_selector 'h3',    text: "Please select size, color, and quantity:"
    end
  end
end
