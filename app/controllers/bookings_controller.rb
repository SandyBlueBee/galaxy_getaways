class BookingsController < ApplicationController
  before_action :set_starship, only: %i[new create]
  before_action :authorize_booking, only: %i[new create edit update destroy]

  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @booking = Booking.new
    @starship = Starship.find(params[:starship_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.starship = @starship
    @booking.user = current_user
    @booking.status = 0
    if @booking.save
      redirect_to starship_path(@starship)
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

  def authorize_booking
    authorize @booking
  end

  def set_starship
    @starship = Starship.find(params[:starship_id])
  end

  def booking_params
    params.require(:booking).permit(:start_month)

  end
end
