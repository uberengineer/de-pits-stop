class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # def after_sign_in_path_for(resource)
  #   if resource.admin
  #     redirect_to
  #   else
  #     redirect_to
  #   end
  # end
end
