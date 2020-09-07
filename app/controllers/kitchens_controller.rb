class KitchensController < ApplicationController
  def update
    @kitchen.kitchen_status = !@kitchen.kitchen_status
    if @kitchen.save
      redirect_to request.referer
    end
  end
end
