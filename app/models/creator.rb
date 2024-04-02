class Creator < ApplicationRecord
  has_many :digital_assets
  has_and_belongs_to_many :brand_owners
  has_many :invitations
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
