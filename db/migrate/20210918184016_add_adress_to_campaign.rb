class AddAdressToCampaign < ActiveRecord::Migration[6.1]
  def change
    add_column :campaigns, :country, :string
    add_column :campaigns, :town, :string
    add_column :campaigns, :zip_code, :string
    add_column :campaigns, :first_adress_line, :string
    add_column :campaigns, :second_adress_line, :string
    add_column :campaigns, :contact_phone_number, :integer
  end
end
