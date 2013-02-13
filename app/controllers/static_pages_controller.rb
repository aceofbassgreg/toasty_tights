class StaticPagesController < ApplicationController
  def shop
  	@product = Product.new(params[:product])
  end
end
