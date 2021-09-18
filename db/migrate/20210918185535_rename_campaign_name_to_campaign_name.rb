class RenameCampaignNameToCampaignName < ActiveRecord::Migration[6.1]
  def change
    rename_column :campaigns, :name, :campaign_name
  end
end
