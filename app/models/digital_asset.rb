class DigitalAsset < ApplicationRecord
  belongs_to :creator
  belongs_to :brand_owner

  private

  def digital_asset_params
    params.require(:digital_asset).permit(:name, :url, :views)
  end
end
