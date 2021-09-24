class AddAreaCodeForCampaigns < ActiveRecord::Migration[6.1]
  def change
    add_column :campaigns, :area_code, :integer, default: 48
  end
end
