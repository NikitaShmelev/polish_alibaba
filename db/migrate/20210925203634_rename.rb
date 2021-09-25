class Rename < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :order_status, :string, default: 'Pending'
  end
end
