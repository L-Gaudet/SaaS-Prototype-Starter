class Asset < ApplicationRecord
  belongs_to :creator
  has_one :brand_owner

  attr_accessor :views
end
