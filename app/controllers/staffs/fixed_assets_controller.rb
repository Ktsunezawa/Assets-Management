class Staffs::FixedAssetsController < ApplicationController

  def new
    @fixed_asset = FixedAsset.new
    @post_image = @fixed_asset.post_images.build
    @base = @fixed_asset.base
    @classification_detail = @fixed_asset.classification_detail
    @bases = Base.all
  end

  def index
    @fixed_assets = FixedAsset.all
  end

  def show
    @fixed_asset = FixedAsset.find(params[:id])
  end

  def create
    @classification_detail = ClassificationDetail.find(params[:classification_detail_id])
    @fixed_asset = FixedAsset.new(fixed_asset_params)
    if @fixed_asset.save
      redirect_to root_path # 申請一覧へ飛ばす
    else
      render 'new'
    end
  end

  def get_detail
    @detail_list = ClassificationDetail.where(classification: params[:classification])
    respond_to do |format|
      format.js
    end
  end

  def get_useful_life
    @useful_life = ClassificationDetail.where(detail: params[:detail])
    respond_to do |format|
      format.js
    end
  end

  private

  def fixed_asset_params
    params.require(:fixed_asset).permit(:name, :cost, :memo, :acquisition_date, :classification_detail_id, :base_id, post_image: [:image])
  end
end
