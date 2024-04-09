class FindCreatorsController < ApplicationController
  before_action :authenticate_brand_owner!
  layout 'brand_owner'

  def index
    @creators = Creator.all
    @page = 'find_creators'
  end

  def create
    if current_brand_owner.creators.exists?(params[:creator_id])
      redirect_to find_creators_path, alert: 'Already connected'
    else
      invitation = Invitation.new(status: :pending)
      invitation.brand_owner = current_brand_owner
      invitation.creator = Creator.find(params[:creator_id])
      
      if invitation.save
        redirect_to find_creators_path, notice: 'Invitation sent'
      else
        redirect_to find_creators_path, alert: 'Invitation failed'
      end
    end
  end
end