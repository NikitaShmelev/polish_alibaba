class RemoveSellerIdFromOrder < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :seller_id
  end
end
