class OrderChannel < ApplicationCable::Channel
  def subscribed
    stream_from "order:orders"
  end
end
