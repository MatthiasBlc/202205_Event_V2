class EventsController < ApplicationController
  before_action :admin_user, only: %i[edit update destroy]
  before_action :authenticate_user!, only: %i[new edit create update destroy]

  def index
    @events = Event.all
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(params_event)
      redirect_to event_path(params[:id])
    else
      flash.now[:alert] = @event.errors.full_messages
      render :edit
    end
  end

  def new
    @event = Event.create
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @attendances = Attendance.all
    @attendances.each do |attendance|
      attendance.destroy if attendance.event_id == @event.id
    end
    @event.destroy
    redirect_to events_path
  end

  def create
    @event = Event.new(admin_id: current_user.id,
                       'title' => params[:event_title],
                       'description' => params[:event_description],
                       'start_date' => params[:event_start_date],
                       'duration' => params[:event_duration],
                       'price' => params[:event_price],
                       'location' => params[:event_location])

    if @event.save
      puts '€' * 50
      puts params
      puts '€' * 50
      redirect_to event_path(Event.all.last.id)
      flash.now[:alert] = 'Yes congrats'
    else
      flash.now[:alert] = @event.errors.full_messages
      render 'new'
    end
  end

  private

  def admin_user
    @event = Event.find(params[:id])
    unless current_user.id == @event.admin_id
      flash[:danger] = "Vous n'êtes pas autorisé à venir dans cette zone"
      redirect_to event_path
    end
  end
end
