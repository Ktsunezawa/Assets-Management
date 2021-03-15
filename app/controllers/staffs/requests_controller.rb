class Staffs::RequestsController < ApplicationController
  
  def index
    @requests = Request.all
  end

  def edit
    @request = Request.find(params[:id])
  end

  private

  def request_params
    params.require(:request).permit(:staff_id, :manager_id, :require_status)
  end
end
