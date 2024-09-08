class MessagesController < ApplicationController

  before_action :authenticate_user!, only: [:create ]


    def create
      @message = Message.new(message_params)
      # @message.user = current_user
      # @message.event = Event.find(params[:event_id])
      if @message.save
        redirect_to event_path(params[:event_id])
      else
        redirect_to root_path
      end
    end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id, event_id: params[:event_id])
  end

end
