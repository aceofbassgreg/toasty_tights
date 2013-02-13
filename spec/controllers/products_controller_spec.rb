require 'spec_helper'

describe ProductsController do
  
  describe 'GET #new' do
  	it "assigns a new Product to @cart" do
  	  get :new
  	  assigns(:product).should be_a_new(Product)
    end

  	it "renders the shop page" do
  	  get :new
  	  response.should render_template 'products/shop'
  	end

  	it "subtracts from in-stock"
  end
end
