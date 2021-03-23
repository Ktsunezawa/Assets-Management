class Managers::StaffsController < ApplicationController
  before_action :authenticate_manager!

  def index
    @staffs = Staff.page(params[:page]).reverse_order
  end

  def destroy
    staff = Staff.find(params[:id])
    staff.discard
    redirect_to root_path
  end
end
