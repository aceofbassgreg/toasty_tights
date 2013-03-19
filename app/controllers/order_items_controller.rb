class OrderItemsController < ApplicationController

  def new
  	@order_item = OrderItem.new
  end

  def index 
  	@products = Product.order(:id)
  end

  def create
  	@cart = current_cart
  	product = Product.find(params[:order_item][:product_id])
  	order_item = params[:order_item]
  	@order_item = @cart.add_product(product.id)

  	respond_to do |format|
  	  if @order_item.save
  	  	format.html { redirect_to 'order_items#shop', 
  	  		notice: 'Item was successfully added to cart' }
  	  	format.json { render json: @order_item,
  	  		status: :created, location: @order_item }
        # product.in_stock.count = product.in_stock.count - product.quantity
  	  else
  	    format.html { render action: "new" }
  	    format.json { render json: @order_item.errors,
  	      status: :unprocessable_entity }
  	  end
  	end
  end 

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    redirect_to 'store#show', notice:  'Item was successfully 
                                      removed from your cart'
  end
end
