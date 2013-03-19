class RemoveQuantityFromQuantity < ActiveRecord::Migration
  def change
  	remove_column :products, :quantity
  end
end
