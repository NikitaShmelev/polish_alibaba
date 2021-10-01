class AddCategoryIdToSub < ActiveRecord::Migration[6.1]
  def change
    add_column :sub_categories, :category_id, :integer
    add_index :sub_categories, :category_id
  end
end
