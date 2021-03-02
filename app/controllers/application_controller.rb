class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if current_user.headhunter?
      stored_location_for(resource) || dashboard_path
    elsif current_user.candidate_profile.nil?
      stored_location_for(resource) || new_candidate_profile_path    
    elsif current_user.candidate?
      stored_location_for(resource) || root_path
    end 
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end
end
