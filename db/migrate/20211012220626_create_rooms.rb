class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :is_private, default: 0

      t.timestamps
    end
  end
end
