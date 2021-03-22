class Managers::FixedAssetsController < ApplicationController
  before_action :authenticate_manager!

  def index
    @q = FixedAsset.ransack(params[:q])
    @fixed_assets = @q.result.includes(:staff).page(params[:page]).reverse_order
  end

  def approved_index
    @q = FixedAsset.ransack(params[:q])
    @fixed_assets = @q.result.includes(:staff).page(params[:page]).reverse_order
  end

  def show
    @fixed_asset = FixedAsset.find(params[:id])
  end

  def allow
    fixed_asset = FixedAsset.find_by(request_status: 0, id: params[:id])
    fixed_asset.approved!
    redirect_to approved_index_managers_fixed_assets_path
  end

  def remand
    fixed_asset = FixedAsset.find_by(request_status: [0,1], id: params[:id])
    fixed_asset.fix!
    redirect_to managers_fixed_assets_path
  end

  def erase
    fixed_asset = FixedAsset.find_by(request_status: 1, id: params[:id])
    fixed_asset.deleted!
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
      :request_status,
      :classification_detail_id,
      classification_detail_attributes: [:classification, :detail, :useful_life],
      post_images_images: []
    ).
      merge(staff_id: current_staff.id)
  end
end
