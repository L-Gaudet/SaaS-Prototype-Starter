class CreatorController < ApplicationController 
  before_action :authenticate_creator!
  layout 'creator'

  def index
    @page = 'dashboard'
  end
end