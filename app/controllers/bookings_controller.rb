class BookingsController < ApplicationController
  before_action :set_starship, only: %i[new create]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = booking.find(params[:id])
    @booking.destroy
    redirect_to starship_path(@booking.starship), status: :see_other
  end

  private

  def set_starship
    @starship = Starship.find(params[:starship_id])
  end

  def booking_params
    params.require(:booking).permit(:start_month, :status)
  end
end