class ProductsController < ApplicationController

  def new
    product = Product.new
    head :ok
  end

  def create
    product = Product.create(params[:product])
    
    if product.save
      head :ok
    else
      render json: product.errors
    end
  end

  def destroy
  	product = Product.find(params[:id])
  	product.destroy
  	head :ok
  end
end
