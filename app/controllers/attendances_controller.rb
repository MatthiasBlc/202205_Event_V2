class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: %i[new index]

  def index
    @event = Event.find(params[:event_id])
    @attendances = Attendance.all
  end

  def new
    @attendance = Attendance.create
    @event = Event.find(params[:event_id])
  end 

  def create
    @event = Event.find(params[:event_id])
    @user = current_user
    @stripe_amount = @event.price
    begin
      customer = Stripe::Customer.create({
                                           email: params[:stripeEmail],
                                           source: params[:stripeToken]
                                         })
      charge = Stripe::Charge.create({
                                       customer: customer.id,
                                       amount: @stripe_amount *100,
                                       description: "Achat d'un produit",
                                       currency: 'eur'
                                     })
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_event_attendance_path
    end

    @attendance = Attendance.new(stripe_customer_id: customer.id,
      user: @user,
      event: @event
    )

    if @attendance.save
      redirect_to event_path(params[:event_id])
    else 
      flash.now[:alert] = @attendance.errors.full_messages
      render 'new'
    end

  end


end
