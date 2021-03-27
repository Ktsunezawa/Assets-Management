class Managers::FixedAssetsController < ApplicationController
  before_action :authenticate_manager!

  def index
    @q = FixedAsset.ransack(params[:q])
    if params[:q]
      @fixed_assets = @q.result.includes(:classification_detail, :strongpoint).page(params[:page]).reverse_order
    else
      @fixed_assets = FixedAsset.where(request_status: 'requesting').includes(:classification_detail, :strongpoint).page(params[:page]).reverse_order
    end
  end

  def approved_index
    @q = FixedAsset.ransack(params[:q])
    if params[:q]
      @fixed_assets = @q.result.includes(:classification_detail, :strongpoint).page(params[:page]).reverse_order
    else
      @fixed_assets = FixedAsset.where(request_status: 'approved').includes(:classification_detail, :strongpoint).page(params[:page]).reverse_order
    end
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

end
