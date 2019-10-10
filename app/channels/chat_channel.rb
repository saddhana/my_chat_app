class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    @message = Message.new(body: data['message'])
    if @message.save
      ActionCable.server.broadcast "chat_channel", message: @message.body
    end
  end
end