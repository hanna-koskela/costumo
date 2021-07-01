class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
  end

  def show
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @bookings = Booking.where(user: current_user).where('date_end > ?', Date.today)
  end
end
