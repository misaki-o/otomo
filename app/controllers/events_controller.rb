class EventsController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :show, :edit ]

  def index
  @event = Event.search(params[:search1], params[:search3] ).order("date ASC")
  # 検索が空欄の時は、全部取ってくるようにモデルに設定済
  end

  def new
  @event = Event.new
  end

  def create
  @event = Event.create(event_params)
   if @event.save
    redirect_to root_path
   else
    render :new, status: :unprocessable_entity
   end
  end

  def show
    @event = Event.find(params[:id])
    @message = Message.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
    redirect_to event_path(@event.id)
    else
    render :edit, status: :unprocessable_entity
    end
  end

  # def search
    # @event = Event.search(params[:search1], params[:search3] )
  # end
  
  private
  
  def event_params
    params.require(:event).permit(:title,:description,:prefecture_id,:date,:start_time,:duration_id,:generation_id,:gender_id,:status_id,:address).merge(user_id: current_user.id)
  end


end
