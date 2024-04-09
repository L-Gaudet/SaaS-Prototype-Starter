class BrandOwnerController < ApplicationController 
  before_action :authenticate_brand_owner!
  layout 'brand_owner'

  def index
    @creators = current_brand_owner.creators
    @page = 'dashboard'
  end
end