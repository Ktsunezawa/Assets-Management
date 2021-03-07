class Staffs::BasesController < ApplicationController
  def index
    @bases = Base.all
    @base = Base.new
  end

  def create
    base = Base.new(base_params)
    base.save
    redirect_to root_path #元の画面へ戻る
  end

  def update
    base = Base.find(params[:id])
    base.update
    redirect_to root_path #元の画面へ戻る
  end

  def destroy
    base = Base.find(params[:id])
    base.destroy
    redirect_to root_path #元の画面へ戻る
  end

  private

  def base_params
    params.require(:base).permit(:name)
  end

end
