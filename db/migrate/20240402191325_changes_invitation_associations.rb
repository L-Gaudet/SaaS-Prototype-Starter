class ChangesInvitationAssociations < ActiveRecord::Migration[7.1]
  def change
    add_reference :invitations, :creator, null: false, foreign_key: true
    add_reference :invitations, :brand_owner, null: false, foreign_key: true
  end
end
