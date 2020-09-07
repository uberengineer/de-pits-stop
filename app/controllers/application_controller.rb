class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_kitchen

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
