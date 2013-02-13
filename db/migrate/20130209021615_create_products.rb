class CreateProducts < ActiveRecord::Migration
  def up
    create_table :products do |t|
      t.string :color
      t.string :size
      t.integer :in_stock
      t.integer :price

      t.timestamps
    end
  end

  def down
  	drop_table :products
  end
end
