class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{params[:sender]}"
  end

  def unsubscribed; end
end
