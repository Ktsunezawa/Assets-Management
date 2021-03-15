class Managers::FixedAssetsController < ApplicationController
  def index
    @fixed_assets = FixedAsset.all
  end

  def show
    @fixed_asset = FixedAsset.find(params[:id])
  end

  def destroy
    fixed_asset = FixedAsset.find(params[:id])
    fixed_asset.destroy
    redirect_to managers_fixed_assets_path
  end

  private

  def fixed_asset_params
    params.require(:fixed_asset).permit(
      :name,
      :cost,
      :memo,
      :acquisition_date,
      :base_id,
      classification_detail_attributes: [:classification, :detail, :useful_life, :period],
      post_images_images: []
      )
      .merge(staff_id: current_staff.id)
  end
end
