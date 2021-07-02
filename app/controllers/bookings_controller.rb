class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)

    redirect_to bookings_path
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to bookings_path
  end

  def index
    @bookings = Booking.where(user: current_user).where('date_end > ?', Date.today)
  end

  private

  def booking_params
    params.require(:booking).permit(:date_start, :date_end, :costume_id)
  end

end
