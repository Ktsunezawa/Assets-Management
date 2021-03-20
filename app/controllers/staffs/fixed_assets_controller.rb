class Staffs::FixedAssetsController < ApplicationController
  before_action :authenticate_staff!

  def new
    @fixed_asset = FixedAsset.new
    @fixed_asset.post_images.build
    @bases = Base.all
    @life_list = ClassificationDetail.all.select('id', 'useful_life')
  end

  def index
    @q = current_staff.fixed_assets.ransack(params[:q])
    @fixed_assets = @q.result.includes(:classification_detail, :base).page(params[:page]).reverse_order
  end

  def approved_index
    @q = FixedAsset.ransack(params[:q])
    @fixed_assets = @q.result.includes(:classification_detail, :base).page(params[:page]).reverse_order
  end

  def show
    @fixed_asset = FixedAsset.find(params[:id])
  end

  def edit
    @fixed_asset = FixedAsset.find(params[:id])
    @bases = Base.all
    @life_list = ClassificationDetail.all.select('id', 'useful_life')
  end

  def create
    @bases = Base.all
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
    fixed_asset.修正中!
    redirect_to staffs_fixed_assets_path
  end

  def update
    @bases = Base.all
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
      :request_status,
      :classification_detail_id,
      classification_detail_attributes: [:classification, :detail, :useful_life],
      post_images_images: []
      )
      .merge(staff_id: current_staff.id)
  end

  def search_params
     params.require(:q).permit(:name_cont, :classification_cont, :detail_cont, :useful_life_not_cont)
  end
end
