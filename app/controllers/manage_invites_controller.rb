class ManageInvitesController < HomeController
  def index
    @invitations = Invitation.where(creator: current_creator, status: :pending)
  end

  def update
    invite = Invitation.find(params[:invite_id])
    if params[:decision] == "accept"
      invite.update!(status: :accepted)
      redirect_to manage_invites_path, notice: "Invitation accepted"
    else 
      invite.update!(status: :rejected)
      redirect_to manage_invites_path, notice: "Invitation rejected"
    end
    
  end
end