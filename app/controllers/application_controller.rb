class ApplicationController < ActionController::Base
  # before_action :authenticate_staff!, except: [:top, :about]
  # before_action :authenticate_manager!, except: [:top, :about]

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
