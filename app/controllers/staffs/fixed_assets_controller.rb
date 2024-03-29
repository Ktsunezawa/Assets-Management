class Staffs::FixedAssetsController < ApplicationController
  before_action :authenticate_staff!

  def new
    @fixed_asset = FixedAsset.new
    @fixed_asset.post_images.build
    @strongpoints = Strongpoint.kept
    @life_list = ClassificationDetail.all.select('id', 'useful_life')
  end

  def index
    @q = current_staff.fixed_assets.ransack(params[:q])
    @fixed_assets = @q.result.includes(:classification_detail, :strongpoint).page(params[:page]).reverse_order
  end

  def approved_index
    @q = FixedAsset.ransack(params[:q])
    @fixed_assets = @q.result.where(request_status: 'approved').includes(:classification_detail, :strongpoint).page(params[:page]).reverse_order
  end

  def show
    @fixed_asset = FixedAsset.find(params[:id])
  end

  def edit
    @fixed_asset = FixedAsset.find(params[:id])
    @strongpoints = Strongpoint.kept
    @life_list = ClassificationDetail.all.select('id', 'useful_life')
  end

  def create
    @strongpoints = Strongpoint.kept
    @life_list = ClassificationDetail.all.select('id', 'useful_life')
    @fixed_asset = current_staff.fixed_assets.new(fixed_asset_params)
    if @fixed_asset.save
       redirect_to staffs_fixed_assets_path
    else
       render :new
    end
  end

  def withdrawal
    fixed_asset = FixedAsset.find_by(request_status: 0, id: params[:id])
    fixed_asset.fix!
    redirect_to staffs_fixed_assets_path
  end

  def update
    @strongpoints = Strongpoint.kept
    @life_list = ClassificationDetail.all.select('id', 'useful_life')
    @fixed_asset = FixedAsset.find(params[:id])
    if @fixed_asset.update(fixed_asset_params)
      redirect_to staffs_fixed_assets_path
    else
      render :edit
    end
  end

  def destroy
    fixed_asset = FixedAsset.find(params[:id])
    fixed_asset.destroy
    redirect_to staffs_fixed_assets_path
  end

  def get_detail
    @detail_list = [ClassificationDetail.new(detail: "選択して下さい")]
    list = ClassificationDetail.kept.where(classification: params[:classification])
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
      :strongpoint_id,
      :request_status,
      :classification_detail_id,
      :image,
      classification_detail_attributes: [:classification, :detail, :useful_life],
      post_images_images: []
    ).
      merge(staff_id: current_staff.id)
  end

end
