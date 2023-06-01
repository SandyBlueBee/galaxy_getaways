class PagesController < ApplicationController

  def home
  end

  def dashboard
    @user = current_user
  end

  def requests
    @bookings = Booking.all
  end
end
