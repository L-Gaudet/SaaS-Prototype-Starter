class DigitalAssetsController < ApplicationController
  before_action :authenticate_creator!, only: %i[ create show edit update destroy ]
  layout 'creator'

  # GET /digital_digital_assets or /digital_assets.json
  def index
    @digital_asset = DigitalAsset.all
  end

  # GET /digital_assets/1 or /digital_assets/1.json
  def show
  end

  # GET /digital_assets/new
  def new
    @digital_asset = DigitalAsset.new
  end

  # GET /digital_assets/1/edit
  def edit
  end

  # POST /digital_assets or /digital_assets.json
  def create
    digital_asset = DigitalAsset.new(
                                      creator: current_creator,
                                      brand_owner: BrandOwner.find(params[:digital_asset][:brand_owner_id]),
                                      name: (params[:digital_asset][:name]),
                                      url: params[:digital_asset][:url],
                                      views: params[:digital_asset][:views],
                                      )

    if digital_asset.name.nil? || digital_asset.url.nil? || digital_asset.views.nil? 
      redirect_to digital_assets_path, alert: 'Digital asset failed to create.'
    end

    if digital_asset.save!
      redirect_to digital_assets_path, notice: 'Digital asset was successfully created.'
    else 
      redirect_to digital_assets_path, alert: 'Digital asset failed to create.'
    end

  end

  # PATCH/PUT /digital_assets/1 or /digital_assets/1.json
  def update
    respond_to do |format|
      if @digital_asset.update(digital_asset_params)
        format.html { redirect_to digital_asset_url(@digital_asset), notice: "digital asset was successfully updated." }
        format.json { render :show, status: :ok, location: @digital_asset }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @digital_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /digital_assets/1 or /digital_assets/1.json
  def destroy
    @digital_asset.destroy!

    respond_to do |format|
      format.html { redirect_to digital_assets_url, notice: "digital asset was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # # Use callbacks to share common setup or constraints between actions.
    # def set_digital_asset
    #   @digital_asset = DigitalAsset.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def digital_asset_params
      params.require(:digital_asset).permit(:name, :url, :views)
    end
end
