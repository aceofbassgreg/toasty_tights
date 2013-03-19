class CreateOrderItems < ActiveRecord::Migration
  def up
    create_table :order_items do |t|
      t.integer :product_id
      t.integer :cart_id

      t.timestamps
    end
  end

  def down
  	drop_table :order_items
  end
end
