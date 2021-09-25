class AddShortDiscriptionToCampaign < ActiveRecord::Migration[6.1]
  def change
    add_column :campaigns, :short_description, :text
  end
end
