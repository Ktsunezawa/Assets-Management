class Staffs::ClassificationsController < ApplicationController
  before_action :authenticate_staff!

  def new
    @classification = Classification.new
    @classification_detail = ClassificationDetail.new
  end

  def index
    @classifications = Classification.all
    @classification_details = ClassificationDetail.all
  end

  def edit
    @classification = Classification.find(params[:id])
    @classification_detail = ClassificationDetail.find(params[:id])
  end

  def create
    classification = Classification.new(classification_params)
    classification.save
    redirect_to root_path
  end

  def update
    classification = Classification.find(params[:id])
    classification.save
    redirect_to root_path
  end

  def destroy
    classification = Classification.find(params[:id])
    classification.destroy
    redirect_to root_path
  end

  private

  def classification_params
    params.require(:classification).permit(:name)
  end

end
