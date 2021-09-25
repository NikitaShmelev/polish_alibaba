class ChangeColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :status, :status, default: 'Pending'
  end
end
