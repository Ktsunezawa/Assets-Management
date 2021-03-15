class Managers::ApprovalsController < ApplicationController

  def create

  end

  def destroy
  end

  private

  def approval_params
    params.require(:approval).permit(:staff_id, :manager_id)
  end
end
