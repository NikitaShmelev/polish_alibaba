class RemoveFieldsFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :seller_name
    remove_column :orders, :buyer_name
    rename_column :orders, :delivery_adress, :adress
    
  end
end
