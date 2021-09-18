class AddNipToCampaign < ActiveRecord::Migration[6.1]
  def change
    add_column :campaigns, :nip, :integer
  end
end
