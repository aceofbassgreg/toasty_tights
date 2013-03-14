require 'spec_helper'

describe CartsController do
  describe 'GET #new' do
  	it "creates a new shopping cart" do
  	  get :new
      response.should be_success
    end
  end

  describe 'DELETE destroy' do
  	before do 
      @cart = Cart.create
      session[:cart_id] = @cart.id
      @order_item = OrderItem.new
      @cart.add_product(1)
    end

  	it "deletes the cart" do 
      expect{
        delete :destroy, id:@cart.id
        }.to change(Cart, :count).by(-1)
    end

  	it "redirects to products/shop" do
  	  delete :destroy, id: @cart
  	  expect redirect_to '/shop'
  	end

  	it "notifies shopper of empty cart" do
  	  delete :destroy, id: @cart
  	  expect notice:'Your shopping cart is now empty.'
  	end
  end
end
