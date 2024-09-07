class EventsController < ApplicationController
  
  before_action :authenticate_user!, only: [:new ]

  def index
  end

  def new
  @event = Event.new
  end

  def create
  # @user = User.find(params[:user_id])
  @event = Event.create(event_params)
   if @event.save
    redirect_to root_path
   else
    redirect_to root_path
    # render :new, status: :unprocessable_entity
   end
  end
  
  private
  
  def event_params
    params.require(:event).permit(:title,:description,:prefecture_id,:date,:start_time,:duration_id,:generation_id,:gender_id,:status_id).merge(user_id: current_user.id)
  end

end
