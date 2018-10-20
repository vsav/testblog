class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
=begin
    devise_parameter_sanitizer.for(:sign_in) << :username
    devise_parameter_sanitizer.for(:account_update) << :username
=end
  end

  def after_sign_in_path_for(resources)
    articles_path(current_user) #your path
  end

  def after_sign_out_path_for(resources)
    articles_path(current_user)
  end
end
