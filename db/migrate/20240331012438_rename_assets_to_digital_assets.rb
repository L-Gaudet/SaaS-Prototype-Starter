class RenameAssetsToDigitalAssets < ActiveRecord::Migration[7.1]
  def change
    rename_table :assets, :digital_assets
  end
end
