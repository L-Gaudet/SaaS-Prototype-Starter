class ManageInvitesController < HomeController
  layout "creator"
  def index
    @invitations = Invitation.where(creator: current_creator, status: :pending)
    @page = "manage_invites"
  end

  def update
    invite = Invitation.find(params[:invite_id])
    if params[:decision] == "accept"
      invite.update!(status: :accepted)
      if !current_creator.brand_owners.exists?(invite.brand_owner.id)
        current_creator.brand_owners << invite.brand_owner
      end
      redirect_to manage_invites_path, notice: "Invitation accepted"
    else 
      invite.update!(status: :rejected)
      redirect_to manage_invites_path, notice: "Invitation rejected"
    end
    
  end
end