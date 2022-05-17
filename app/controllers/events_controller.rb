class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @events = Event.all
  end

  def secret; end

  def new
    @event = Event.create
  end

  def show
    @event = Event.find(params[:id])
    
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
end
