class BrandOwnerController < ApplicationController 
  before_action :authenticate_brand_owner!
  layout 'brand_owner'

  def index
    @creators = current_brand_owner.creators
    @page = 'dashboard'
    @digital_asset = current_brand_owner.digital_assets
    @total_views = @digital_asset.sum(:views)
  end
end