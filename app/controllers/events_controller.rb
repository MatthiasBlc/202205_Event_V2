class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def secret
    
  end
end
