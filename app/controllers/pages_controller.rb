class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    unless current_user.admin
      redirect_to menu_items_path
    end
  end

  def confirmation

  end
end
