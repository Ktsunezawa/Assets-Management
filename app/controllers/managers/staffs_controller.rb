class Managers::StaffsController < ApplicationController
  before_action :authenticate_manager!

  def index
    @staffs = Staff.all
  end

  def destroy
    staff = Staff.find(params[:id])
    staff.destroy
    redirect_to root_path
  end
end
