class ChangeDefValue < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:orders, :order_status, nil)
    remove_column :orders, :order_status, :status
  end
end
