class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  def after_sign_in_path_for(resource)
    if resource.admin
      dashboard_path
    else
      menu_items_path
    end
  end
end
