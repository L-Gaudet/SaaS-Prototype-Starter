class CreatorController < ApplicationController 
  before_action :authenticate_creator!
  layout 'creator', except: [:show]

  def index
    @page = 'dashboard'
    @digital_asset = current_creator.digital_assets
    @total_views = @digital_asset.sum(:views)
  end

  def show
    @creator = Creator.find(params[:id])
    if current_brand_owner
      render layout: 'brand_owner'
    elsif current_creator
      render layout: 'creator'
    else
      render layout: 'application'
    end
  end

end