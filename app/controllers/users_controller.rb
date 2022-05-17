class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:show]


  def show
    @user = User.find(current_user.id)
    @events = Event.all
  end
end
