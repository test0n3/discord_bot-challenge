class MessagesController < ApplicationController
  def index
    @messages = Message.where(state: 1).order_by(release_date: :desc)
  end

  def destroy
    @message = Message.find(params[:id])
    @message.update(state: 3)
    redirect_to messages_path
  end
end
