class FindCreatorsController < ApplicationController
  before_action :authenticate_brand_owner!
  def index
    @creators = Creator.all
  end
end