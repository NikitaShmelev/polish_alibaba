class AddAdressToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :delivery_adress, :string
  end
end
