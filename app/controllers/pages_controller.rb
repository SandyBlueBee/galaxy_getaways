class PagesController < ApplicationController

  def home
  end

  def dashboard
    @user = current_user
    @bookings = Booking.all
  end

  def requests
    @bookings = Booking.all
  end

  def my_starships
    @user = current_user
  end
end
