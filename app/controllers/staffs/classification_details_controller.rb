class Staffs::ClassificationDetailsController < ApplicationController
  before_action :authenticate_staff!

  def new
    @classification_detail = ClassificationDetail.new
  end

  def index
    @q = ClassificationDetail.ransack(params[:q])
    @classification_details = @q.result(distinct: true).page(params[:page])
  end

  def edit
    @classification_detail = ClassificationDetail.find(params[:id])
  end

  def create
    @classification_detail = ClassificationDetail.new(classification_detail_params)
    if @classification_detail.save
      redirect_to staffs_classification_details_path
    else
      render :new
    end
  end

  def update
    @classification_detail = ClassificationDetail.find(params[:id])
    if @classification_detail.update(classification_detail_params)
      redirect_to staffs_classification_details_path
    else
      render :edit
    end
  end

  def destroy
    classification_detail = ClassificationDetail.find(params[:id])
    classification_detail.discard
    redirect_to staffs_classification_details_path
  end

  private

  def classification_detail_params
    params.require(:classification_detail).permit(:classification, :detail, :useful_life)
  end
end
