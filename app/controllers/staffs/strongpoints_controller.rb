class Staffs::StrongpointsController < ApplicationController
  before_action :authenticate_staff!

  def index
    @strongpoints = Strongpoint.kept
    @strongpoint = Strongpoint.new
  end

  def create
    @strongpoints = Strongpoint.kept
    @strongpoint = Strongpoint.new(strongpoint_params)
    if @strongpoint.save
      redirect_to staffs_strongpoints_path
    else
      render :index
    end
  end

  def destroy
    strongpoint = Strongpoint.find(params[:id])
    strongpoint.discard
    redirect_to staffs_strongpoints_path
  end

  private

  def strongpoint_params
    params.require(:strongpoint).permit(:name)
  end
end
