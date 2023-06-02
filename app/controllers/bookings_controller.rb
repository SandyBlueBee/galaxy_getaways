class BookingsController < ApplicationController
  # validate :start_month, uniqueness: {
  #   message: "already booked this month" }
  before_action :set_starship, only: %i[new create]

  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @starship = Starship.find(params[:starship_id])
    @booking = Booking.new
    @bookings = @starship.bookings
    month_existant = @bookings.collect {|b| b.start_month}
    months = (1..12).to_a
    month_restant = months - month_existant
    hash_month = {
      '1': ['January', '1'],
      '2': ['February', '2'],
      '3': ['March', '3'],
      '4': ['April', '4'],
      '5': ['May', '5'],
      '6': ['June', '6'],
      '7': ['July', '7'],
      '8': ['August', '8'],
      '9': ['September', '9'],
      '10': ['October', '10'],
      '11': ['November', '11'],
      '12': ['December', '12']
    }
    @collection_month = []
    month_restant.each do |i|
      @collection_month << hash_month[:"#{i.to_s}"]
    end

    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.starship = @starship
    @booking.user = current_user
    authorize @booking
    @booking.status = 0
    if @booking.save
      redirect_to starship_path(@starship)
      flash.notice = "This starship has been booked!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @booking
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to starship_path(@booking.starship), status: :see_other
  end

  def update
    @bookings = policy_scope(Booking)
  end

  def approved
    @booking = Booking.find(params[:id])
    authorize @booking

    @booking.update(status: 1)
    redirect_to requests_path, status: :see_other
  end

  def declined
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(status: 2)
    @booking.status
    redirect_to requests_path, status: :see_other
  end

  private

  def set_starship
    @starship = Starship.find(params[:starship_id])
  end

  def booking_params
    params.require(:booking).permit(:start_month)
  end
end
