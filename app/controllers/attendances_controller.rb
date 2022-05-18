class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: %i[new index]


  def new
  end

  def index
  end
end
