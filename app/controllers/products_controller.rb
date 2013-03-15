class ProductsController < ApplicationController

  def new
    @product = Product.new
    redirect_to 'home'
  end

  def create
    @product = Product.create(params[:product])
    redirect_to 'home'
  end
end
