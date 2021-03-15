class Staffs::FixedAssetsController < ApplicationController

  def new
    @fixed_asset = FixedAsset.new
    @fixed_asset.post_images.build
    @bases = Base.all
    @life_list = ClassificationDetail.all.select('id', 'useful_life', 'period')
  end

  def index
    @fixed_assets = FixedAsset.all
  end

  def show
    @fixed_asset = FixedAsset.find(params[:id])
  end

  def create
    @classification_detail = ClassificationDetail.find(params[:fixed_asset][:classification_detail_id])
    @base = Base.find(params[:fixed_asset][:base_id])
    @fixed_asset = current_staff.fixed_assets.new(fixed_asset_params)
    @fixed_asset.classification_detail = @classification_detail
    @fixed_asset.base = @base
    if @fixed_asset.save
      redirect_to root_path # 申請一覧へ飛ばす
    else
      render 'new'
    end
  end

  def get_detail
    @detail_list = [ClassificationDetail.new(detail: "選択して下さい")]
    list = ClassificationDetail.where(classification: params[:classification])
    list.each do |item|
      @detail_list.push(item)
    end
    respond_to do |format|
      format.js
    end
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
