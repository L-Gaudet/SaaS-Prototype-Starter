class CreatorController < ApplicationController 
  before_action :authenticate_creator!
  layout 'creator'

  def index
    @page = 'dashboard'
    @digital_asset = current_creator.digital_assets
    @total_views = @digital_asset.sum(:views)
  end
end