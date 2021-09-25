class AddPaidToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :paid, :integer, default: 0
  end
end
