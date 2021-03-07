class Staffs::FixedAssetsController < ApplicationController

  def new
    @fixed_asset = FixedAsset.new
  end

  def index
    @fixed_assets = FixedAsset.all
  end

  def show
    @fixed_asset = FixedAsset.find(params[:id])
  end

  def create
    fixed_asset = FixedAsset.new(fixed_asset_params)
    if fixed_asset.save
       redirect_to root_path #申請一覧へ飛ばす
    else
      render 'new'
    end
  end

  private

  def fixed_asset_params
    params.require(:fixed_asset).permit(:name, :cost, :memo, :acquisition_date)
  end
end
