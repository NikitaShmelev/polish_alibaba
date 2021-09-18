class CampaignsController < ApplicationController
  # before_action :set_campaign, only: %i[ show edit update destroy ]

  # GET /campaigns or /campaigns.json
  def index
    @campaigns = Campaign.all
  end

  # GET /campaigns/1 or /campaigns/1.json
  def show
    @campaign = Campaign.find(params[:id])
  end

  def edit
  end


  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_campaign
  #     @campaign = Campaign.find(params[:id])
  #   end

  #   # Only allow a list of trusted parameters through.
  #   def campaign_params
  #     params.fetch(:campaign, {})
  #   end
end
