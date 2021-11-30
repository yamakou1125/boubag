class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    users_my_page_path
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  # def signed_in_root_path(resource_or_scope)
  #   users_my_page_path
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
