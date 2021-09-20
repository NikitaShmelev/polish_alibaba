class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.text :short_description
      t.string :image
      t.float :price
      t.integer :quantity
      t.references :campaign, null: false, foreign_key: true

      t.timestamps
    end
  end
end
