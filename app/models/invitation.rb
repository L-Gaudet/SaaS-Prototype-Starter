class Invitation < ApplicationRecord
  belongs_to :brand_owner
  belongs_to :creator
  enum :status, [ :pending, :accepted, :rejected]
end
