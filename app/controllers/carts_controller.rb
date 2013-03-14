class CartsController < ApplicationController
  def new
    @cart = Cart.new
  end

  def destroy
  	@cart = current_cart
  	@cart.destroy
  	session[:cart_id] = nil
  	redirect_to shop_path, notice: 'Your shopping cart is now empty.'
  end
end
