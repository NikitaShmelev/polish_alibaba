class RemoveNameFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :product_name
  end
end
