class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :product_name
      t.integer :product_id
      t.integer :buyer_id
      t.integer :seller_id
      t.integer :seller_name
      t.integer :price
      t.timestamps
    end
  end
end
