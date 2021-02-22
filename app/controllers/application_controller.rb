class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end
end
