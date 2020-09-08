class ApplicationController < ActionController::Base
  # before_action :redirect_root_domain
  before_action :authenticate_user!
  before_action :set_kitchen
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :organization])
  end

  def after_sign_in_path_for(resource)
    if resource.admin
      dashboard_path
    else
      menu_items_path
    end
  end

  def set_kitchen
    @kitchen = Kitchen.first
  end
end
