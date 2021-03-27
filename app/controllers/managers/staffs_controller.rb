class Managers::StaffsController < ApplicationController
  before_action :authenticate_manager!

  def index
    @staffs = Staff.kept.page(params[:page]).reverse_order
  end

  def destroy
    staff = Staff.find(params[:id])
    staff.discard
    redirect_to managers_staffs_path
  end
end
