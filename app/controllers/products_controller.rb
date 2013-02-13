class ProductsController < ApplicationController

  def new
    @product = Product.new(params[:product])
    render 'products/shop'
  end

  # def create
  #   @product = Product.new(params[:product])
  # end
end
