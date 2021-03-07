class Staffs::BasesController < ApplicationController
  before_action :authenticate_staff!

  def index
    @bases = Base.all
    @base = Base.new
  end

  def create
    @bases = Base.all
    @base = Base.new(base_params)
    if @base.save
       redirect_to staffs_bases_path
    else
      render :index
    end
  end

  def destroy
    base = Base.find(params[:id])
    base.destroy
    redirect_to staffs_bases_path
  end

  private

  def base_params
    params.require(:base).permit(:name)
  end

end
