class Staffs::StaffsController < ApplicationController
  before_action :authenticate_staff!

  def edit
    @staff = current_staff
  end

  def update
    @staff = current_staff
    if @staff.update(staff_params)
     bypass_sign_in(@staff)
     redirect_to edit_staffs_staffs_path
    else
      render 'edit'
    end
  end

  private

  def staff_params
    params.require(:staff).permit(:name, :email, :password)
  end
end
