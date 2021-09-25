class ChangeColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :status, :status
  end
end
