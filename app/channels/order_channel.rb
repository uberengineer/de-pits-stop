class OrderChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_for order
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
